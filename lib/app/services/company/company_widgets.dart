import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart'; 
import 'package:ga_proj/app/store/serviceStore.dart';
import 'package:ga_proj/global/globals_widgets.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:provider/provider.dart';

class CompanyWidgets {
  BuildContext context;
  CompanyWidgets(this.context);

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
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Meus Fornecedores",
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
                            "Aqui você pode visualizar os fornecedores e preços cadastrados",
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
    final ServiceStore companiesStore =
        Provider.of<ServiceStore>(context, listen: false);
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
        child: Container(
          width: double.infinity,
          height: 600.0,
          decoration: BoxDecoration(
            color: ThemeModeApp.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                color: ThemeModeApp.of(context).primary.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
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
                        text: 'Principais Fornecedores',
                      ),
                    ],
                  ),
                ),
                Observer(builder: (_) {
                  return Expanded(
                      child: TabBarView(
                    children: [
                      companiesStore.loading
                          ? const Center(child: CircularProgressIndicator())
                          : Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              child: companiesStore.listCompanies.isEmpty
                                  ? Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12.0, horizontal: 16.0),
                                        child: Text('Não há fornecedores Cadastros',
                                            style: ThemeModeApp.of(context)
                                                .headlineSmall),
                                      ),
                                    )
                                  : ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount:
                                          companiesStore.listCompanies.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        // log("aaaaa ${solicitacaoComuniqueStore.soliciataoComuniqueListNaoEnviado[index].dataInsercao}");
                                        return GlobalsWidgets(context)
                                            .cardsSolicitacaoEmAndamento(
                                          data: companiesStore.listCompanies[index]
                                                  .company?.phone??
                                              "",
                                          status:companiesStore.listCompanies[index]
                                                  .company?.email ?? " ",
                                          buttomTitle: 'Ver',
                                          subtitle:
                                              "${companiesStore.listCompanies[index]
                                                  .address?.street ?? "Sem descrição"}, ${companiesStore.listCompanies[index].address?.number ?? "Sem número"} - ${companiesStore.listCompanies[index].address?.city ?? "Sem cidade"} ",
                                          title:
                                              companiesStore.listCompanies[index]
                                                  .company?.name ?? "Sem nome",
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
