import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ga_proj/global/globals_fonts.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';

import '../../../global/globals_functions.dart';

class RelatorioVendasPageDetalhes extends StatefulWidget {
  const RelatorioVendasPageDetalhes({super.key});

  @override
  State<RelatorioVendasPageDetalhes> createState() =>
      _RelatorioVendasPageDetalhesState();
}

class _RelatorioVendasPageDetalhesState
    extends State<RelatorioVendasPageDetalhes> {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeModeApp.of(context);
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: ThemeModeApp.of(context).primaryBackground,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ThemeModeApp.of(context).primaryText,
                    ),
                  ),
                  Text("Relatorio Vendas Detalhes",
                      style: FontsThemeModeApp(theme).titleLarge),
                ],
              ),
            ),
            // vendas desse dia
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * .6,
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
                    children: [
                      Text("Vendas deste dia",
                          style: FontsThemeModeApp(theme).titleLarge),
                      // listar as vendas do dia => valor, cliente e data

                      Container(
                        height: MediaQuery.of(context).size.height * .4,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 20.0, 0.0, 2.0),
                              child: Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                  const EdgeInsetsDirectional
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
                                                  'Custom Name',
                                                  style:
                                                      FontsThemeModeApp(theme)
                                                          .titleMedium,
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                            0.0, 2.0, 0.0, 0.0),
                                                    child: Text(
                                                      'Data da venda: 12/12/2021',
                                                      style: FontsThemeModeApp(
                                                              theme)
                                                          .labelSmall,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'R\$ 100,00',
                                          style: FontsThemeModeApp(theme)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 0.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: theme.primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Adicionar despesa",
                                    style: FontsThemeModeApp(theme).titleMedium,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        color: theme.alternate,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 20.0),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Valor Total:",
                                    style: FontsThemeModeApp(theme).titleLarge,
                                  ),
                                  Text(
                                    "R\$ 100,00",
                                    style: FontsThemeModeApp(theme).titleLarge,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                      // mostrar card para adicionar despesas
                      // o valor da despesa entra na lista de exibição e calcula o total
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * .6,
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
                    children: [
                      Text("Vendas desse Mês",
                          style: FontsThemeModeApp(theme).titleLarge),
                      // listar as vendas do dia => valor, cliente e data

                      Container(
                        height: MediaQuery.of(context).size.height * .4,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 20.0, 0.0, 2.0),
                              child: Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                  const EdgeInsetsDirectional
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
                                                  'Custom Name',
                                                  style:
                                                      FontsThemeModeApp(theme)
                                                          .titleMedium,
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                            0.0, 2.0, 0.0, 0.0),
                                                    child: Text(
                                                      'Data da venda: 12/12/2021',
                                                      style: FontsThemeModeApp(
                                                              theme)
                                                          .labelSmall,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'R\$ 100,00',
                                          style: FontsThemeModeApp(theme)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 0.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: theme.primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Adicionar despesa",
                                    style: FontsThemeModeApp(theme).titleMedium,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        color: theme.alternate,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 20.0),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Valor Total:",
                                    style: FontsThemeModeApp(theme).titleLarge,
                                  ),
                                  Text(
                                    "R\$ 100,00",
                                    style: FontsThemeModeApp(theme).titleLarge,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                      // mostrar card para adicionar despesas
                      // o valor da despesa entra na lista de exibição e calcula o total
                    ],
                  ),
                ),
              ),
            ),

            // vendas desse mes
          ],
        ),
      ),
    ));
  }
}
