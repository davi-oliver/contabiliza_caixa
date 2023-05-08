import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ga_proj/app/services/relatorio_vendas_detalhes/relatorio_vendas_page.dart';
import 'package:ga_proj/app/services/service_contabiliza_caixa.dart';
import 'package:ga_proj/app/store/serviceStore.dart';
import 'package:ga_proj/global/globals_fonts.dart';
import 'package:ga_proj/global/theme/themeligth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../global/globals_animations.dart';
import '../../../global/globals_functions.dart';
import '../../../global/theme/theme_mode.dart';
import '../../../global/theme/themedark.dart';
import '../services_functions.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with TickerProviderStateMixin {
  late TabController _tabController;
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
    _tabController = new TabController(length: 3, vsync: this);
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

  Future _getLocal() async {
    final local = await LocalPath().localEpModificacao;
    if (await local.exists()) {
      print("Arquivo existe");

      serviceStore.setListCountDiario(jsonDecode(await local.readAsString()));
    } else {
      print("Arquivo não existe");
    }
    return local;
  }

  @override
  void didChangeDependencies() {
    // declare provider
    serviceStore = Provider.of<ServiceStore>(context, listen: false);
    // _getLocal();
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
                    'Relatorios',
                    style: FontsThemeModeApp(theme).titleLarge,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (currentTheme is LightModeTheme) {
                            currentTheme = DarkModeTheme();
                          } else {
                            currentTheme = LightModeTheme();
                          }
                        });
                      },
                      icon: Icon(
                        currentTheme is LightModeTheme
                            ? FontAwesomeIcons.sun
                            : FontAwesomeIcons.moon,
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
                                            ThemeModeApp.of(context).lineColor,
                                        center: Text(
                                          '23%',
                                          style: FontsThemeModeApp(theme)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: ThemeModeApp.of(context)
                                                    .alternate,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FontsThemeModeApp(theme)
                                                            .bodyMediumFamily),
                                              ),
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
                                          style: FontsThemeModeApp(theme)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: ThemeModeApp.of(context)
                                                    .tertiary,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FontsThemeModeApp(theme)
                                                            .bodyMediumFamily),
                                              ),
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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: ThemeModeApp.of(context).primary600,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    ThemeModeApp.of(context).primary,
                    ThemeModeApp.of(context).tertiary,
                    ThemeModeApp.of(context).primary600,
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
                          'R\$ 0,00',
                          style: FontsThemeModeApp(theme).buttonStyle,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.all(5.0),
                          child: LinearPercentIndicator(
                            percent: 0.93,
                            lineHeight: 20.0,
                            barRadius: Radius.circular(19.0),
                            animation: true,
                            progressColor: ThemeModeApp.of(context).primary,
                            backgroundColor: ThemeModeApp.of(context).accent3,
                            leading: Text(
                              '93%',
                              style: FontsThemeModeApp(theme)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: ThemeModeApp.of(context).accent3,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(FontsThemeModeApp(theme)
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
                                            builder: (_) => CtbCaixa()));
                                  },
                                  child: Text(
                                    'Cadastrar Venda',
                                    style: FontsThemeModeApp(theme).bodySmall,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

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
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, int index) {
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                              'Custom Name',
                                              style: FontsThemeModeApp(theme)
                                                  .titleMedium,
                                            ),
                                            if (responsiveVisibility(
                                              context: context,
                                              tabletLandscape: false,
                                              desktop: false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: Text(
                                                  'Rua A, 123, Bairro, Cidade, Estado',
                                                  style:
                                                      FontsThemeModeApp(theme)
                                                          .labelSmall,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'user@domainname.com',
                                        style:
                                            FontsThemeModeApp(theme).bodyMedium,
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                  ))
                                    Expanded(
                                      child: Text(
                                        dateTimeFormat(
                                            'MEd', getCurrentTimestamp),
                                        style:
                                            FontsThemeModeApp(theme).bodyMedium,
                                      ),
                                    ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    Expanded(
                                      child: Text(
                                        dateTimeFormat(
                                            'relative', getCurrentTimestamp),
                                        style:
                                            FontsThemeModeApp(theme).bodyMedium,
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
