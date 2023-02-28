// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:components_ui/components_ui.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ga_proj/app/services/services_functions.dart';
import 'package:intl/intl.dart';

class CtbCaixa extends StatefulWidget {
  const CtbCaixa({super.key});

  @override
  State<CtbCaixa> createState() => _CtbCaixaState();
}

class _CtbCaixaState extends State<CtbCaixa> {
  String? selectedPaymentOption;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.arrow_back_ios),
                    Text(
                      'Contabiliza Caixa',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .15),
                Container(
                  width: size.width * .9,
                  height: size.height * .63,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              DateTime.now().day.toString(),
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Text(
                                              DateFormat("MMM", "pt_BR")
                                                  .format(DateTime.now()),
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFieldCampo(
                              titulo: 'Quantidade',
                              icon: const Icon(Icons.confirmation_number),
                              icon2: const Icon(
                                FontAwesomeIcons.trash,
                                color: Colors.red,
                              ),
                              campo: 'Quantidade',
                              controllador: controlladorQtd,
                            ),
                            TextFieldCampo(
                              titulo: 'Preço',
                              icon: const Icon(Icons.attach_money),
                              icon2: const Icon(
                                FontAwesomeIcons.trash,
                                color: Colors.red,
                              ),
                              campo: 'Preço',
                              controllador: controllerPreco,
                            ),
                            TextFieldCampo(
                              titulo: 'Cliente',
                              icon: const Icon(Icons.person),
                              icon2: const Icon(
                                FontAwesomeIcons.trash,
                                color: Colors.red,
                              ),
                              campo: 'Clienete',
                              numero: false,
                              controllador: controlladorCliente,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: DropdownButton(
                                value: selectedPaymentOption,
                                items: paymentOptions,
                                hint:
                                    const Text('Selecione a forma de pagamento',
                                        // style of the dropdown hint
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                // style of the dropdown items
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                // style of the dropdown button
                                dropdownColor: Colors.white,
                                icon: const Icon(Icons.arrow_drop_down),
                                // center text in the dropdown button

                                iconSize: 36,
                                isExpanded: true,

                                onChanged: (value) {
                                  setState(() {
                                    selectedPaymentOption = value!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: const Text(
                                    'Total',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Text(
                                    'R\$ $valorTotal',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  KitButton(
                                    decorationButton: const BoxDecoration(
                                        color: Colors.green),
                                    height: MediaQuery.of(context).size.height *
                                        .07,
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    widgetCenter: const Text(
                                      'Salvar',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const List<DropdownMenuItem<String>> paymentOptions = [
  DropdownMenuItem(
    value: 'pix',
    child: Text('Pix'),
  ),
  DropdownMenuItem(
    value: 'debit_card',
    child: Text('Cartão de débito'),
  ),
  DropdownMenuItem(
    value: 'credit_card',
    child: Text('Cartão de crédito'),
  ),
  DropdownMenuItem(
    value: 'money',
    child: Text('Dinheiro'),
  ),
];

class TextFieldCampo extends StatefulWidget {
  String? titulo;
  Widget icon;
  Widget icon2;
  String? campo;
  TextEditingController? controllador;
  bool numero;
  TextFieldCampo({
    Key? key,
    this.titulo,
    required this.icon,
    required this.icon2,
    this.campo,
    this.numero = true,
    required this.controllador,
  }) : super(key: key);

  @override
  State<TextFieldCampo> createState() => _TextFieldCampoState();
}

class _TextFieldCampoState extends State<TextFieldCampo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: widget.controllador,
        onChanged: (value) {
          if (widget.titulo == "Quantidade" &&
              controllerPreco.text.isNotEmpty) {
            setState(() {
              valorTotal = (double.parse(controlladorValor.text) *
                      double.parse(controlladorQtd.text) /
                      100)
                  .toString();
            });
          } else if (widget.titulo == "Preço" &&
              controlladorQtd.text.isNotEmpty) {
            setState(() {
              valorTotal = (double.parse(controlladorValor.text) *
                      double.parse(controlladorQtd.text) /
                      100)
                  .toString();
            });
          } else {
            valorTotal = "0.00";
          }
        },
        keyboardType: !widget.numero
            ? TextInputType.text
            : TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: widget.titulo,
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
