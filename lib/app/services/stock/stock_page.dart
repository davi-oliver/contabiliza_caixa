import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:ga_proj/app/services/home/home_widgets.dart';
import 'package:ga_proj/app/services/stock/stock_widgets.dart';
import 'package:ga_proj/app/services/stock/store/stock_store.dart';
import 'package:ga_proj/backend/db/api/get/get.supabase.service.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:ga_proj/models/stock.dart';
import 'package:provider/provider.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {

  late StockStore stockStore;
  @override
  void didChangeDependencies() {

    stockStore = Provider.of<StockStore>(context, listen: false);
    initPage();
    super.didChangeDependencies();
  }

  bool init = false;

  initPage() async {
    if (!init) {
      final rep = await GetSupaBaseApi().findSaleAll();
      stockStore.clearProducts();
      if (rep != []) {
        for (var element in rep) {
          StockInfo stock = StockInfo.fromJson(element);
          stockStore.addStockProduct(stock);
        }
      }
      setState(() {
        init = true;
      });
    }
  }
  
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ThemeModeApp.of(context).secondaryBackground,
      body: SafeArea(
        top: true,
        child: SliderDrawer(
          appBar: SliderAppBar(
              appBarColor: ThemeModeApp.of(context).secondaryBackground,
              drawerIconColor: ThemeModeApp.of(context).secondaryText,
              title: Text(" ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
          slider: HomeWidgets(context).drawerMenu(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StockWidgets(context).widgetPrincipal(),
            ],
          ),
        ),
      ),
    );
  }
}
