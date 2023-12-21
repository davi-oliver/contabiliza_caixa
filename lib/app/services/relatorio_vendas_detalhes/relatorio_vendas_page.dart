// import 'dart:developer';

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ga_proj/app/services/sales/store/store_sale.dart';
import 'package:ga_proj/app/services/services_functions.dart';
import 'package:ga_proj/app/store/serviceStore.dart';
import 'package:ga_proj/global/globals_fonts.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import '../../../global/globals_functions.dart';

class RelatorioVendasPageDetalhes extends StatefulWidget {
  const RelatorioVendasPageDetalhes({super.key});

  @override
  State<RelatorioVendasPageDetalhes> createState() =>
      _RelatorioVendasPageDetalhesState();
}

class _RelatorioVendasPageDetalhesState
    extends State<RelatorioVendasPageDetalhes> {
  bool carregando = true;

  Future init() async {
    await ServicesFunctions(context).findAllSaleDay();
    setState(() {
      carregando = false;
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeModeApp.of(context);
    final store = Provider.of<SaleStore>(context, listen: false);
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: ThemeModeApp.of(context).primaryBackground,
      child: carregando
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
                              color: index.isEven ? Colors.blue : Colors.white,
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
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
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
                        Text("Relatório de suas vendas do dia",
                            style: FontsThemeModeApp(theme).bodyLarge),
                      ],
                    ),
                  ),
                  // vendas desse dia
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * .7,
                        minHeight: MediaQuery.of(context).size.height * .7,
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 4.0),
                        child: Column(
                          children: [
                            Text("Vendas deste dia",
                                style: FontsThemeModeApp(theme).titleLarge),
                            // listar as vendas do dia => valor, cliente e data

                            SizedBox(
                              height: MediaQuery.of(context).size.height * .4,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: store.listSaleDay.length,
                                physics: AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 20.0, 0.0, 2.0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12.0, 2.0, 12.0, 12.0),
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
                                                            .fromSTEB(0.0, 0.0,
                                                            12.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: Image.network(
                                                        'https://images.unsplash.com/photo-1611691543545-f19c70f74a29?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQ0fHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                                                        width: 40.0,
                                                        height: 40.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Observer(builder: (_) {
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          store
                                                                  .listSaleDay[
                                                                      index]
                                                                  .product
                                                                  ?.name ??
                                                              "Produto não encontrado",
                                                          style:
                                                              FontsThemeModeApp(
                                                                      theme)
                                                                  .headlineSmall,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            'Quantidade: ${store.listSaleDay[index].quantity}\n Pagamento: ${store.listSaleDay[index].paymentType}',
                                                            style:
                                                                FontsThemeModeApp(
                                                                        theme)
                                                                    .labelSmall,
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'R\$ ${store.listSaleDay[index].total}',
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
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Adicionar despesa",
                                          style: FontsThemeModeApp(theme)
                                              .titleMedium,
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
                                          style: FontsThemeModeApp(theme)
                                              .titleLarge,
                                        ),
                                        Text(
                                          "R\$ ${store.listSaleDay.map((e) => e.total).reduce((value, element) => value + element)}",
                                          style: FontsThemeModeApp(theme)
                                              .titleLarge,
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
                        maxHeight: MediaQuery.of(context).size.height * .7,
                        minHeight: MediaQuery.of(context).size.height * .7,
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 4.0),
                        child: Column(
                          children: [
                            Text("Vendas desse Mês",
                                style: FontsThemeModeApp(theme).titleLarge),
                            // listar as vendas do dia => valor, cliente e data

                            Container(
                              height: MediaQuery.of(context).size.height * .4,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: store.listSaleMounth.length,
                                physics: AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  var item = store.listSaleMounth[index];
                                  return Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 20.0, 0.0, 2.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12.0, 2.0, 12.0, 12.0),
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
                                                            .fromSTEB(0.0, 0.0,
                                                            12.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: Image.network(
                                                        'https://images.unsplash.com/photo-1611691543545-f19c70f74a29?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQ0fHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                                                        width: 40.0,
                                                        height: 40.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AutoSizeText(
                                                        'Venda de ${item.product?.name}',
                                                        style:
                                                            FontsThemeModeApp(
                                                                    theme)
                                                                .titleMedium,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                2.0, 0.0, 0.0),
                                                        child: Text(
                                                          'Quantidade: ${store.listSaleMounth[index].quantity}\nPagamento: ${store.listSaleMounth[index].paymentType}',
                                                          style:
                                                              FontsThemeModeApp(
                                                                      theme)
                                                                  .labelSmall,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(0.0,
                                                                2.0, 0.0, 0.0),
                                                        child: Text(
                                                          'Em ${formmatDateToText(item.createdAt)}',
                                                          style:
                                                              FontsThemeModeApp(
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
                                                'R\$ ${item.total}',
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
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Adicionar despesa",
                                          style: FontsThemeModeApp(theme)
                                              .titleMedium,
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
                                          style: FontsThemeModeApp(theme)
                                              .titleLarge,
                                        ),
                                        Text(
                                          "R\$ ${store.listSaleMounth.map((e) => e.total).reduce((value, element) => value + element)}",
                                          style: FontsThemeModeApp(theme)
                                              .titleLarge,
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

String formmatDateToText(String date) {
  DateTime parsedDate = DateTime.parse(date);

// Define o formato da data
  DateFormat dateFormat = DateFormat("dd 'de' MMMM 'de' yyyy", 'pt_BR');

// Formata a data
  String formattedDate = dateFormat.format(parsedDate);
  return formattedDate;
}
