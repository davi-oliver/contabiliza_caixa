import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:ga_proj/app/services/home/home_widgets.dart';
import 'package:ga_proj/app/services/home/store/home_store.dart';
import 'package:ga_proj/app/services/sales/store/store_sale.dart';
import 'package:ga_proj/app/store/serviceStore.dart';
import 'package:ga_proj/backend/db/api/get/get.supabase.service.dart';
import 'package:ga_proj/models/client_info.dart';
import 'package:provider/provider.dart';
import '../../../global/theme/theme_mode.dart';
import '../services_functions.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with TickerProviderStateMixin {
  late TabController tabController;
  late ScrollController _scrollController;
  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        if (_isAppBarExpanded == true) {
        } else {}
      });
    tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ViewRelatorio extends StatefulWidget {
  const ViewRelatorio({super.key});

  @override
  State<ViewRelatorio> createState() => _ViewRelatorioState();
}

class _ViewRelatorioState extends State<ViewRelatorio>
    with SingleTickerProviderStateMixin {
  late ServiceStore serviceStore;
  late SaleStore store;
  late HomeStore homeStore;
  ThemeMode themeMode = ThemeModeApp.themeMode;

  Future _getClients() async {
    final rep = await GetSupaBaseApi().findAllClient();
    if (rep != []) {
      for (var element in rep) {
        ClientInfo client = ClientInfo.fromJson(element);
        serviceStore.addListClientes(client);
      }
    }

    // busca todas as vendas do dia

    await ServicesFunctions(context).findAllSaleDay();
    setState(() {});
    // set total day from sales
  }

  var totalDay;
  @override
  void initState() {
    _getClients();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // declare provider
    serviceStore = Provider.of<ServiceStore>(context, listen: false);
    store = Provider.of<SaleStore>(context, listen: false);
    homeStore = Provider.of<HomeStore>(context, listen: false);
    super.didChangeDependencies();
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        themeMode = mode;
        ThemeModeApp.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    // declare mediaquery
    final mediaQuery = MediaQuery.of(context).size;
    final theme = ThemeModeApp.of(context);
    return Scaffold(
      backgroundColor: theme.primaryBackground,
      body: GestureDetector(
        onTap: () {
          if (homeStore.visibilityProfile) {
            homeStore.setVisibilityProfile(false);
          }
          if (homeStore.visibilityNotification) {
            homeStore.setVisibilityNotification(false);
          }
        },
        child: Container(
          width: mediaQuery.width,
          height: mediaQuery.height,
          color: theme.secondaryBackground,
          child: Stack(
            children: [
              SliderDrawer(
                appBar: SliderAppBar(
                    appBarHeight: 110,
                    appBarColor: ThemeModeApp.of(context).primaryBackground,
                    drawerIconColor: ThemeModeApp.of(context).secondaryText,
                    trailing: Row(
                      children: [
                        // alternate theme
                        Container(
                          decoration: BoxDecoration(
                            color: theme.primaryBackground,
                            border: Border.all(
                              color: theme.primaryText.withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () {
                              setThemeMode(
                                  ThemeModeApp.themeMode != ThemeMode.light
                                      ? ThemeMode.dark
                                      : ThemeMode.light);
                            },
                            icon: Icon(
                              Icons.nightlight_outlined,
                              color: theme.primaryText.withOpacity(0.4),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: theme.primaryBackground,
                            border: Border.all(
                              color: theme.primaryText.withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () {
                              homeStore.setVisibilityNotification(true);
                            },
                            icon: Icon(
                              Icons.notifications_none_rounded,
                              color: theme.primaryText.withOpacity(0.4),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            homeStore.setVisibilityProfile(true);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: theme.primaryBackground,
                                border:
                                    Border.all(color: theme.primary, width: 3),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child:
                                  HomeWidgets(context).miniaturaFotoPerfil()),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    title: Text("Dashboard",
                        style: ThemeModeApp.of(context).labelLarge.copyWith(
                            color: ThemeModeApp.of(context).primaryText))),
                slider: HomeWidgets(context).drawerMenu(),
                child: Stack(
                  children: [
                    Container(
                      color: theme.secondaryBackground,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          HomeWidgets(context).dashbordRelatorio(),
                          HomeWidgets(context).cardSale(),
                          HomeWidgets(context).myClientes(),
                          // make a circularProgressIndicator horizontal
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Observer(builder: (_) {
                return Visibility(
                    visible: homeStore.visibilityProfile,
                    child: HomeWidgets(context).cardMenuProfile(theme));
              }),
              Observer(builder: (_) {
                return Visibility(
                    visible: homeStore.visibilityNotification,
                    child: HomeWidgets(context).cardNotificationList(theme));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
