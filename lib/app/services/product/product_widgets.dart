import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ga_proj/app/services/product/store/product_store.dart';
import 'package:ga_proj/global/globals_widgets.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:provider/provider.dart';

class ProductsWidgets {
  BuildContext context;
  ProductsWidgets(this.context);

  
  Widget widgetCreateProduct() {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Produtos",
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
                            "Aqui você pode cadastrar um novo produto",
                            style: ThemeModeApp.of(context).labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // botoesConfiguracaoEConta(),
        
              ],
            ),
          ),
        ),
      ),
    );
  }

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Produtos",
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
    final ProductStore productStore = Provider.of(context, listen: false);
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
        child: Container(
          width: double.infinity,
          height: 600.0,
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
                      productStore.loading
                          ? const Center(child: CircularProgressIndicator())
                          : Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              child: productStore.products.isEmpty
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
                                      itemCount: productStore.products.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        // log("aaaaa ${solicitacaoComuniqueStore.soliciataoComuniqueListNaoEnviado[index].dataInsercao}");
                                        return GlobalsWidgets(context)
                                            .cardsSolicitacaoEmAndamento(
                                          data: "${productStore.products[index]
                                                  .quantityStock.toString()} em Estoque",
                                          status: "R\$ ${productStore.products[index].price.toString()} a Unidade",
                                          buttomTitle: 'Ver',
                                          subtitle:
                                              "${productStore.products[index].description ?? "Sem descrição"}",
                                          title:
                                              "${productStore.products[index].name ?? "Sem nome"}",
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
