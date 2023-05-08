import 'package:components_ui/components_ui.dart';
import 'package:emoji_alert/arrays.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ga_proj/app/services/service_contabiliza_caixa.dart';
import 'package:ga_proj/app/services/services_functions.dart';
import 'package:ga_proj/app/store/serviceStore.dart';
import 'package:ga_proj/global/globals_fonts.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../global/theme/themedark.dart';
import '../../global/theme/themeligth.dart';

class ContabilizaCaixaWidgets {
  BuildContext context;
  ContabilizaCaixaWidgets(this.context);
  Widget widgetPrincipal() {
    final size = MediaQuery.of(context).size;
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
                Observer(builder: (_) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButton(
                      value: serviceContabilizaCaixaStoreT.tipoPagamentoValue,
                      items: paymentOptions,
                      hint: Text('Selecione a forma de pagamento',
                          // style of the dropdown hint
                          style: FontsThemeModeApp(theme).headlineSmall),
                      // style of the dropdown items
                      style: FontsThemeModeApp(theme).titleMedium,
                      // style of the dropdown button
                      dropdownColor: theme.secondaryBackground,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: theme.accent1,
                      ),
                      // center text in the dropdown button

                      iconSize: 36,
                      isExpanded: true,

                      onChanged: (value) {
                        serviceContabilizaCaixaStoreT.setTipoPagamento(value!);
                        print(context.read<ServiceStore>().tipoPagamentoValue);
                      },
                    ),
                  );
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
    final theme = ThemeModeApp.of(context);
    return Observer(builder: (_) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Observer(builder: (_) {
              return KitButton(
                decorationButton: BoxDecoration(
                    color: theme.tertiary,
                    borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width * .5,
                widgetCenter: Text(
                  'Salvar',
                  style: FontsThemeModeApp(theme).buttonStyle,
                ),
                onTap: () async {
                  serviceContabilizaCaixaStore.setLoading(true);
                  await ServicesFunctions(context).setPathVenda();
                  serviceContabilizaCaixaStore.setLoading(false);
                  // ignore: use_build_context_synchronously
                },
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
    final size = MediaQuery.of(context).size;
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
