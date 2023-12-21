import 'dart:convert';
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ga_proj/app/local/local_storage.dart';
import 'package:ga_proj/app/services/relatorio_vendas_detalhes/relatorio_vendas_page.dart';
import 'package:ga_proj/app/services/contabiliza_caixa_page.dart';
import 'package:ga_proj/app/services/sales/store/store_sale.dart';
import 'package:ga_proj/app/store/serviceStore.dart';
import 'package:ga_proj/backend/db.supabase.dart';
import 'package:ga_proj/backend/db/api/get/get.supabase.service.dart';
import 'package:ga_proj/components/flutter_flow/flutter_flow_widgets.dart';
import 'package:ga_proj/global/globals_fonts.dart';
import 'package:ga_proj/global/theme/themeligth.dart';
import 'package:ga_proj/models/client_info.dart';
import 'package:ga_proj/models/sale.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../../global/theme/theme_mode.dart';
import '../../../global/theme/themedark.dart';
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
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // declare mediaquery
    final mediaQuery = MediaQuery.of(context).size;
    final theme = ThemeModeApp.of(context);
    return Scaffold(
      body: Container(
        width: mediaQuery.width,
        height: mediaQuery.height,
        color: theme.primaryBackground,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.transparent,
                  ),
                  Text(
                    'Relatórios',
                    style: FontsThemeModeApp(theme).titleLarge,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: Icon(
                        FontAwesomeIcons.moon,
                        color: ThemeModeApp.of(context).tertiary,
                      )),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 8.0, 4.0),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * .5,
                  maxHeight: MediaQuery.of(context).size.height * .5,
                  maxWidth: MediaQuery.of(context).size.width * .9,
                ),
                decoration: BoxDecoration(
                  color: ThemeModeApp.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(16.0),
                ),
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dashboard Vendas Mensal',
                        style: FontsThemeModeApp(theme).headlineSmall,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          'Uma visão geral das vendas mensais',
                          style: FontsThemeModeApp(theme).bodySmall,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        RelatorioVendasPageDetalhes(),
                                  ),
                                );
                              },
                              child: Text(
                                'Ver mais',
                                style: FontsThemeModeApp(theme).bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.all(4),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.all(40.0),
                                      child: CircularPercentIndicator(
                                        percent: 0.23,
                                        radius: 45.0,
                                        lineWidth: 12.0,
                                        animation: true,
                                        progressColor:
                                            ThemeModeApp.of(context).alternate,
                                        backgroundColor:
                                            ThemeModeApp.of(context).primary,
                                        center: Text(
                                          '23%',
                                          style: ThemeModeApp.of(context)
                                              .labelLarge,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Vendas Deste Mês',
                                      style: FontsThemeModeApp(theme).bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.all(40.0),
                                      child: CircularPercentIndicator(
                                        percent: 0.93,
                                        radius: 45.0,
                                        lineWidth: 12.0,
                                        animation: true,
                                        progressColor:
                                            ThemeModeApp.of(context).tertiary,
                                        backgroundColor:
                                            ThemeModeApp.of(context).lineColor,
                                        center: Text(
                                          '93%',
                                          style: ThemeModeApp.of(context)
                                              .labelLarge,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Vendas Ultimo Mês',
                                      style: FontsThemeModeApp(theme).bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // make a circularProgressIndicator horizontal
            Observer(builder: (_) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: ThemeModeApp.of(context).primary,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      ThemeModeApp.of(context).info,
                      ThemeModeApp.of(context).info.withOpacity(0.9),
                      ThemeModeApp.of(context).info.withOpacity(0.6),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Vendas de Hoje',
                            style: FontsThemeModeApp(theme).buttonStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'R\$ ${store.listSaleDay.isEmpty ? "0,00" : store.listSaleDay.map((e) => e.total).reduce((value, element) => value + element).toStringAsFixed(2)}',
                            style: FontsThemeModeApp(theme).buttonStyle,
                          ),
                        ],
                      ),
                      Observer(builder: (_) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.all(5.0),
                              child: LinearPercentIndicator(
                                percent: 0.9,
                                lineHeight: 20.0,
                                barRadius: Radius.circular(19.0),
                                animation: true,
                                progressColor: ThemeModeApp.of(context).info,
                                backgroundColor:
                                    ThemeModeApp.of(context).primaryBackground,
                                leading: Text(
                                  '${90}%',
                                  style: FontsThemeModeApp(theme)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: ThemeModeApp.of(context).accent3,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FontsThemeModeApp(theme)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: ThemeModeApp.of(context).accent4,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    ContabilizaCaixaPage()));
                                      },
                                      child: Text(
                                        'Cadastrar Venda',
                                        style:
                                            FontsThemeModeApp(theme).bodySmall,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              );
            }),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Meus Clientes',
                    style: FontsThemeModeApp(theme).titleMedium,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: ThemeModeApp.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 2.0),
                  )
                ],
              ),
              child: serviceStore.listaClientes.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        "Você ainda não possui clientes cadastrados",
                        style: FontsThemeModeApp(theme).bodyMedium,
                      ),
                    )
                  : ListView.builder(
                      itemCount: serviceStore.listaClientes.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, int index) {
                        var item = serviceStore.listaClientes[index];
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 20.0, 0.0, 2.0),
                              child: Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 2.0, 12.0, 12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 12.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                child: Image.network(
                                                  'https://images.unsplash.com/photo-1611691543545-f19c70f74a29?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQ0fHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                                                  width: 40.0,
                                                  height: 40.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AutoSizeText(
                                                  '${item.name}',
                                                  style:
                                                      FontsThemeModeApp(theme)
                                                          .titleMedium,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: theme.primary,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
            ),
            // ListTile(
            //   leading: Text(
            //     "QTDE\n${serviceStore.listaCountDiario[0].quantidade}",
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //   title: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Data ",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       Text(
            //         "${DateFormat('dd/MM/yyyy').format(DateTime.parse(serviceStore.listaCountDiario[1].dataDia.toString()))}",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       SizedBox(height: 4),
            //       Text(serviceStore.listaCountDiario[1].cliente!),
            //       SizedBox(height: 4),
            //       Text(
            //           'Valor unidade: ${serviceStore.listaCountDiario[1].valorUnidade}'),
            //     ],
            //   ),
            //   trailing: Text(
            //     'Preço final: ${serviceStore.listaCountDiario[1].valorTotal}',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // )

            // ListView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //       shrinkWrap: true,
            //       itemBuilder: (context, int index){
            //         return Container(
            //           width: mediaQuery.width * 0.9,
            //           height: mediaQuery.height * 0.1,
            //           color: Colors.red,
            //           child: Text(serviceStore.listaCountDiario[index].cliente.toString())
            //         )
            //         ;
            //       },
            //       itemCount: serviceStore.listaCountDiario.length),
          ]),
        ),
      ),
    );
  }
}
