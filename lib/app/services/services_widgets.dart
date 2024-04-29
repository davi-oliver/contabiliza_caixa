// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ga_proj/app/services/adicionar_produto/adicionar_produto.dart';
import 'package:ga_proj/app/services/sales/store/store_sale.dart';
import 'package:ga_proj/app/services/services_functions.dart';
import 'package:ga_proj/app/store/serviceStore.dart';
import 'package:ga_proj/backend/datasource/results.dart';
import 'package:ga_proj/components/flutter_flow/flutter_flow_widgets.dart';
import 'package:ga_proj/global/globals_fonts.dart';
import 'package:ga_proj/global/globals_routes.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:ga_proj/models/item.dart';
import 'package:ga_proj/models/product.dart';
import 'package:go_router/go_router.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ContabilizaCaixaWidgets {
  BuildContext context;
  ContabilizaCaixaWidgets(this.context);
  Widget widgetPrincipal() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          cardBrancoFundo(),
        ],
      ),
    );
  }

  Widget cardBrancoFundo() {
    final size = MediaQuery.of(context).size;
    final serviceContabilizaCaixaStore =
        Provider.of<ServiceStore>(context, listen: false);
    final serviceContabilizaCaixaStoreT =
        Provider.of<ServiceStore>(context, listen: true);
    final theme = ThemeModeApp.of(context);
    final store = Provider.of<SaleStore>(context, listen: true);
    return Container(
      width: size.width * .9,
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: theme.accent1.withOpacity(0.09),
            spreadRadius: 1,
            blurRadius: 9,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: theme.secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius:
                                    5.0, // has the effect of softening the shadow
                                spreadRadius:
                                    0.0, // has the effect of extending the shadow
                                offset: Offset(
                                  1.0, // horizontal, move right 10
                                  2.0, // vertical, move down 10
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(DateTime.now().day.toString(),
                                    style: FontsThemeModeApp(theme).labelLarge),
                                Text(
                                    DateFormat("MMM", "pt_BR")
                                        .format(DateTime.now()),
                                    style: FontsThemeModeApp(theme).labelLarge),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
                TextFieldCampo(
                  titulo: 'Quantidade',
                  onChanged: (p0) {
                    serviceContabilizaCaixaStore.setQuantidade();
                  },
                  icon: Icon(
                    Icons.confirmation_number,
                    color: theme.accent1,
                  ),
                  icon2: Icon(
                    FontAwesomeIcons.trash,
                    color: theme.error,
                  ),
                  campo: 'Quantidade',
                  controllador: controlladorQtd,
                ),
                // dropdown products
                StatefulBuilder(builder: (context, StateSetter setState) {
                  return Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(color: Colors.grey),
                        ),
                        height: MediaQuery.of(context).size.height * .071,
                        padding: const EdgeInsets.all(10),
                        child: DropdownButton<Product?>(
                          hint: Text(
                            "Selecione o produto",
                            style: ThemeModeApp.of(context)
                                .headlineSmall
                                .copyWith(
                                  color: ThemeModeApp.of(context).primaryText,
                                ),
                          ),
                          value: store.itemSelectedProduct,
                          isExpanded: true,
                          iconSize: 30,
                          underline: Container(
                            color: Colors.transparent,
                          ),
                          alignment: Alignment.centerLeft,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: store.listItensProduct.map((Product item) {
                            return DropdownMenuItem<Product?>(
                              value: item,
                              child: Text(item.name?? ""),
                            );
                          }).toList(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          onChanged: (Product? value) {
                            if (value != null) {
                              setState(() {
                                Product item = value;
                                controllerPreco
                                    .updateValue(item.price!.toDouble());
                                store.setItemSelectedProduct(item);
                                serviceContabilizaCaixaStore.setValorUnidade();
                                serviceContabilizaCaixaStore.setValorTotal();
                                log("item ${value.name}");
                              });
                            }
                          },
                        ),
                      ),
                    );
                  });
                }),

                FFButtonWidget(text: "Cadastrar Produto", onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) {
                    return AdicionarProdutoPage();
                  
                  })));
                }, options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: theme.tertiary,
                  textStyle: FontsThemeModeApp(theme).buttonStyle,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),),
                
                TextFieldCampo(
                  titulo: 'Preço',
                  onChanged: (p0) {
                    serviceContabilizaCaixaStore.setValorUnidade();
                    serviceContabilizaCaixaStore.setValorTotal();
                  },
                  icon: Icon(
                    Icons.attach_money,
                    color: theme.accent1,
                  ),
                  icon2: Icon(
                    FontAwesomeIcons.trash,
                    color: theme.error,
                  ),
                  campo: 'Preço',
                  controllador: controllerPreco,
                ),
                TextFieldCampo(
                  titulo: 'Cliente',
                  icon: Icon(
                    Icons.person,
                    color: theme.accent1,
                  ),
                  icon2: Icon(
                    FontAwesomeIcons.trash,
                    color: theme.error,
                  ),
                  campo: 'Cliente',
                  numero: false,
                  controllador: controlladorCliente,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),

                StatefulBuilder(builder: (context, StateSetter setState) {
                  return Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(color: Colors.grey),
                        ),
                        height: MediaQuery.of(context).size.height * .071,
                        padding: const EdgeInsets.all(10),
                        child: DropdownButton<ItemType?>(
                          hint: Text(
                            "Selecione o tipo de pagamento",
                            style: ThemeModeApp.of(context)
                                .headlineSmall
                                .copyWith(
                                  color: ThemeModeApp.of(context).primaryText,
                                ),
                          ),
                          value: store.itemSelectedPayment,
                          isExpanded: true,
                          iconSize: 30,
                          underline: Container(
                            color: Colors.transparent,
                          ),
                          alignment: Alignment.centerLeft,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: store.listItensPayment.map((ItemType? item) {
                            return DropdownMenuItem<ItemType>(
                              value: item!,
                              child: Text(item.name),
                            );
                          }).toList(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          onChanged: (ItemType? value) {
                            if (value != null) {
                              setState(() {
                                store.setItemSelectedPayment(value);
                                log("item ${value.name}");
                              });
                            }
                          },
                        ),
                      ),
                    );
                  });
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                Observer(builder: (_) {
                  return Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          'Total',
                          style: FontsThemeModeApp(theme).titleLarge,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          'R\$ ${serviceContabilizaCaixaStoreT.valorTotal.replaceAll('.', ',')}',
                          style: FontsThemeModeApp(theme).titleLarge,
                        ),
                      ),
                    ],
                  );
                }),
                botaoSalvar()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget botaoSalvar() {
    final serviceContabilizaCaixaStore =
        Provider.of<ServiceStore>(context, listen: false);
    final store = Provider.of<SaleStore>(context, listen: false);
    final theme = ThemeModeApp.of(context);
    return Observer(builder: (_) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Observer(builder: (_) {
              return FFButtonWidget(
                onPressed: () async {
                  // validate controllers
                  // return scaffold mensage
                  if (controlladorQtd.text.isEmpty) {
                    return ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Adicione a quantidade"),
                        backgroundColor: theme.error,
                      ),
                    );
                  }

                  if (controllerPreco.text.isEmpty) {
                    return ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Adicione o preço"),
                        backgroundColor: theme.error,
                      ),
                    );
                  }

                  if (controlladorCliente.text.isEmpty) {
                    return ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Adicione o nome do cliente"),
                        backgroundColor: theme.error,
                      ),
                    );
                  }

                  if (serviceContabilizaCaixaStore.valorTotal == "0,00") {
                    return ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Adicione o valor total"),
                        backgroundColor: theme.error,
                      ),
                    );
                  }

                  if (store.itemSelectedPayment == null) {
                    return ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Selecione o tipo de pagamento"),
                        backgroundColor: theme.error,
                      ),
                    );
                  }
                  serviceContabilizaCaixaStore.setLoading(true);
                  Results result = await ServicesFunctions(context)
                      .createSale(
                          quantidade: controlladorQtd.text,
                          valorTotal:
                              serviceContabilizaCaixaStore.valorTotal,
                          valorUnidade:
                              serviceContabilizaCaixaStore.valorUnidade,
                          cliente: controlladorCliente.text,
                          productId: store.itemSelectedProduct.id,
                          pagamentoId: store.itemSelectedPayment!.id);
                  if (result.sucess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Venda adicionada com sucesso"),
                        backgroundColor: theme.success,
                      ),
                    );
                    controlladorQtd.text = "";
                    controllerPreco.updateValue(0);
                    controlladorCliente.text = "";
                    serviceContabilizaCaixaStore.setValorTotal();
                    serviceContabilizaCaixaStore.setValorUnidade();

                    context.pushNamed(homePage);
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Erro ao adicionar venda"),
                        backgroundColor: theme.error,
                      ),
                    );
                  }
                  serviceContabilizaCaixaStore.setLoading(false);
                  // ignore: use_build_context_synchronously
                },
                text: 'Salvar',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: theme.tertiary,
                  textStyle: FontsThemeModeApp(theme).buttonStyle,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}

class TextFieldCampo extends StatefulWidget {
  String? titulo;
  Widget icon;
  Widget icon2;
  String? campo;
  TextEditingController? controllador;
  bool numero;
  Function(String)? onChanged;
  TextFieldCampo({
    Key? key,
    this.titulo,
    required this.icon,
    required this.icon2,
    this.campo,
    this.numero = true,
    this.onChanged,
    required this.controllador,
  }) : super(key: key);

  @override
  State<TextFieldCampo> createState() => _TextFieldCampoState();
}

class _TextFieldCampoState extends State<TextFieldCampo> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
// TODO IMPLEMENTS CALCULA VALOR  TOTAL
    final theme = ThemeModeApp.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: widget.controllador,
        onChanged: widget.onChanged,
        keyboardType: !widget.numero
            ? TextInputType.text
            : const TextInputType.numberWithOptions(decimal: true),
        style: FontsThemeModeApp(theme).headlineMedium,
        decoration: InputDecoration(
          labelText: widget.titulo,
          labelStyle: FontsThemeModeApp(theme).labelLarge,
          prefixIcon: widget.icon,
          suffixIcon: IconButton(
            icon: widget.icon2,
            onPressed: () {
              widget.controllador!.text == "";
            },
          ),
        ),
      ),
    );
  }
}
