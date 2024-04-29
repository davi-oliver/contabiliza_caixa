
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ga_proj/app/services/stock/store/stock_store.dart';
import 'package:ga_proj/global/globals_widgets.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:provider/provider.dart';

class StockWidgets{
  BuildContext context;
  StockWidgets(this.context);

   Widget widgetPrincipal() {
    return Expanded(
      child: Align(
        alignment: const AlignmentDirectional(0.00, -1.00),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 1170.0,
          ),
          decoration: BoxDecoration(
              color: ThemeModeApp.of(context).secondaryBackground),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // perfilFotoName(),
                // linhaAlterarTema(),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                     Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 12.0, 0.0, 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Meu Estoque",
                            style: ThemeModeApp.of(context).headlineLarge,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Icon(Icons.info_outline_rounded,
                              color: ThemeModeApp.of(context).secondaryText),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          Text(
                            "Aqui você pode visualizar os produtos cadastrados",
                            style: ThemeModeApp.of(context).labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // botoesConfiguracaoEConta(),
                tabbarWidget(), 
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget tabbarWidget() {
    final StockStore stockStore = Provider.of<StockStore>(context, listen: false);
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
        child: Container(
          width: double.infinity,
          height: 400.0,
          decoration: BoxDecoration(
            color: ThemeModeApp.of(context).primaryBackground,
            boxShadow:   [
              BoxShadow(
                blurRadius: 6.0,
                color: ThemeModeApp.of(context).primaryText.withOpacity(0.1),
                offset: Offset(0.0, -2.0),
              )
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: DefaultTabController(
              length: 1,
              initialIndex: 0,
              child: Column(children: [
                Align(
                  alignment: const Alignment(0.0, 0),
                  child: TabBar(
                    isScrollable: true,
                    labelColor: ThemeModeApp.of(context).primary,
                    unselectedLabelColor:
                        ThemeModeApp.of(context).secondaryText,
                    labelStyle: ThemeModeApp.of(context).bodyMedium,
                    indicatorColor: ThemeModeApp.of(context).primary,
                    indicatorWeight: 2.0,
                    tabs: const [
                      Tab(
                        text: 'Categoria 1',
                      ),
                    ],
                  ),
                ),
                Observer(builder: (_) {
                  return Expanded(
                      child: TabBarView(
                    children: [
                      stockStore.loading
                          ? const Center(child: CircularProgressIndicator())
                          : Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              child: stockStore.products.isEmpty
                                  ? Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12.0, horizontal: 16.0),
                                        child: Text('Não há produtos Cadastros',
                                            style: ThemeModeApp.of(context)
                                                .headlineSmall),
                                      ),
                                    )
                                  : ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount: stockStore.products.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        // log("aaaaa ${solicitacaoComuniqueStore.soliciataoComuniqueListNaoEnviado[index].dataInsercao}");
                                        return GlobalsWidgets(context)
                                            .cardsSolicitacaoEmAndamento(
                                          data: stockStore.products[index]
                                                  .dataInsercao ??
                                              "02/02/2022",
                                          status: "Cadastrado",
                                          buttomTitle: 'Ver',
                                          subtitle:
                                              "${stockStore.products[index].descricao ?? "Sem descrição"}",
                                          title:
                                              "${stockStore.products[index].nome ?? "Sem nome"}",
                                          onTap: () {},
                                        );
                                      },
                                    ),
                            ),
                      // Padding(
                      //   padding: const EdgeInsetsDirectional.fromSTEB(
                      //       16.0, 12.0, 16.0, 12.0),
                      //   child: productStore.products.isEmpty
                      //       ? Center(
                      //           child: Padding(
                      //             padding: const EdgeInsets.symmetric(
                      //                 vertical: 12.0, horizontal: 16.0),
                      //             child: Text('Sem Solicitações em Andamento',
                      //                 style: ThemeModeApp.of(context)
                      //                     .headlineSmall),
                      //           ),
                      //         )
                      //       : ListView.builder(
                      //           padding: EdgeInsets.zero,
                      //           itemCount: productStore.products.length,
                      //           shrinkWrap: true,
                      //           scrollDirection: Axis.vertical,
                      //           itemBuilder: (context, index) {
                      //             return GlobalsWidgets(context)
                      //                       .cardsSolicitacaoEmAndamento(
                      //                     data: productStore.products[index]
                      //                             .dataInsercao ??
                      //                         "02/02/2022",
                      //                     status: "Cadastrado",
                      //                     buttomTitle: 'Ver',
                      //                     subtitle:
                      //                         "${productStore.products[index].descricao ?? "Sem descrição"}",
                      //                     title:
                      //                         "${productStore.products[index].nome ?? "Sem nome"}",
                      //                     onTap: () {},
                      //                   );
                      //           },
                      //         ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsetsDirectional.fromSTEB(
                      //       16.0, 12.0, 16.0, 12.0),
                      //   child: productStore.products.isEmpty
                      //       ? Center(
                      //           child: Padding(
                      //             padding: const EdgeInsets.symmetric(
                      //                 vertical: 12.0, horizontal: 16.0),
                      //             child: Text('Sem Solicitações Finalizadas',
                      //                 style: ThemeModeApp.of(context)
                      //                     .headlineSmall),
                      //           ),
                      //         )
                      //       : ListView.builder(
                      //           padding: EdgeInsets.zero,
                      //           itemCount: productStore.products.length,
                      //           shrinkWrap: true,
                      //           scrollDirection: Axis.vertical,
                      //           itemBuilder: (context, index) {
                      //             return GlobalsWidgets(context)
                      //                       .cardsSolicitacaoEmAndamento(
                      //                     data: productStore.products[index]
                      //                             .dataInsercao ??
                      //                         "02/02/2022",
                      //                     status: "Cadastrado3",
                      //                     buttomTitle: 'Ver',
                      //                     subtitle:
                      //                         "${productStore.products[index].descricao ?? "Sem descrição"}",
                      //                     title:
                      //                         "${productStore.products[index].nome ?? "Sem nome"}",
                      //                     onTap: () {},
                      //                   );
                      //           },
                      //         ),
                      // ),
                    ],
                  ));
                }),
              ]),
            ),
          ),
        ));
  }
}