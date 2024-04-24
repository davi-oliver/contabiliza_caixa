import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ga_proj/app/services/services_widgets.dart';
import 'package:ga_proj/app/store/serviceStore.dart';
import 'package:ga_proj/global/globals_fonts.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:provider/provider.dart';

class AdicionarProdutoPage extends StatefulWidget {
  const AdicionarProdutoPage({super.key});

  @override
  State<AdicionarProdutoPage> createState() => _AdicionarProdutoPageState();
}

class _AdicionarProdutoPageState extends State<AdicionarProdutoPage> {
 late ServiceStore serviceContabilizaCaixaStore;
  late ServiceStore serviceContabilizaCaixaStoreT;
  bool _carregando = true;
  // late AnimationController _controllerAnimation;

  Future init () async {
 
      setState(() {
      _carregando = false;
    });
  }
  @override
  void initState() {
    init();
    Future.delayed(Duration(seconds: 5));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    serviceContabilizaCaixaStore =
        Provider.of<ServiceStore>(context, listen: false);
    serviceContabilizaCaixaStoreT =
        Provider.of<ServiceStore>(context, listen: true);
    serviceContabilizaCaixaStore.setLoading(false);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = ThemeModeApp.of(context);

    return Scaffold(
        backgroundColor: ThemeModeApp.of(context).primaryBackground,
        body: _carregando
            ? Center(
                child: Center(
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SpinKitWave(
                          size: 20.0,
                          duration: Duration(milliseconds: 1500),
                          itemCount: 5,
                          itemBuilder: (context, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color:
                                    index.isEven ? Colors.blue : Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16.0),
                        Text('Carregando...')
                      ],
                    ),
                  ),
                ),
              )
            : Observer(builder: (_) {
                return Container(
                  width: size.width,
                  height: size.height,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                            
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: theme.primaryText,
                              ),
                            ),
                            Text(
                              'Contabiliza Caixa',
                              style: FontsThemeModeApp(theme).headlineSmall,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                     
                                  });
                                },
                                icon: Icon(
                                  FontAwesomeIcons.moon,
                                  color: ThemeModeApp.of(context).tertiary,
                                )),
                          ],
                        ),
                        serviceContabilizaCaixaStore.loading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ContabilizaCaixaWidgets(context).widgetPrincipal()
                      ],
                    ),
                  ),
                );
              }));
  }
}