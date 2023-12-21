// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
 
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ga_proj/app/services/home/home_page.dart';
import 'package:ga_proj/app/services/services_functions.dart';
import 'package:ga_proj/app/services/services_widgets.dart';
import 'package:ga_proj/global/globals_fonts.dart';
import 'package:provider/provider.dart'; 
import 'package:ga_proj/app/store/serviceStore.dart';

import '../../global/theme/theme_mode.dart';

class ContabilizaCaixaPage extends StatefulWidget {
  const ContabilizaCaixaPage({super.key});

  @override
  State<ContabilizaCaixaPage> createState() => _ContabilizaCaixaPageState();
}

class _ContabilizaCaixaPageState extends State<ContabilizaCaixaPage> with TickerProviderStateMixin {
  late ServiceStore serviceContabilizaCaixaStore;
  late ServiceStore serviceContabilizaCaixaStoreT;
  bool _carregando = true;
  // late AnimationController _controllerAnimation;

  Future init () async {
      await ServicesFunctions(context).initPage();
      setState(() {
      _carregando = false;
    });
  }
  @override
  void initState() {
    init();
    Future.delayed(Duration(seconds: 5));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    serviceContabilizaCaixaStore =
        Provider.of<ServiceStore>(context, listen: false);
    serviceContabilizaCaixaStoreT =
        Provider.of<ServiceStore>(context, listen: true);
    serviceContabilizaCaixaStore.setLoading(false);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = ThemeModeApp.of(context);

    return Scaffold(
        backgroundColor: ThemeModeApp.of(context).primaryBackground,
        body: _carregando
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
                                color:
                                    index.isEven ? Colors.blue : Colors.white,
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
            : Observer(builder: (_) {
                return Container(
                  width: size.width,
                  height: size.height,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewRelatorio()));
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: theme.primaryText,
                              ),
                            ),
                            Text(
                              'Contabiliza Caixa',
                              style: FontsThemeModeApp(theme).headlineSmall,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                     
                                  });
                                },
                                icon: Icon(
                                  FontAwesomeIcons.moon,
                                  color: ThemeModeApp.of(context).tertiary,
                                )),
                          ],
                        ),
                        serviceContabilizaCaixaStore.loading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ContabilizaCaixaWidgets(context).widgetPrincipal()
                      ],
                    ),
                  ),
                );
              }));
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
  DropdownMenuItem(
    value: 'check',
    child: Text('A ver'),
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
    required this.controllador,
    this.numero = true,
  }) : super(key: key);

  @override
  State<TextFieldCampo> createState() => _TextFieldCampoState();
}

class _TextFieldCampoState extends State<TextFieldCampo> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final serviceContabilizaCaixaStore =
        Provider.of<ServiceStore>(context, listen: false);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Observer(builder: (_) {
        return TextField(
          controller: widget.controllador,
          onChanged: (value) {
            serviceContabilizaCaixaStore.setValorTotal();
          },
          keyboardType: !widget.numero
              ? TextInputType.text
              : const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: widget.titulo,
            prefixIcon: widget.icon,
            suffixIcon: IconButton(
              icon: widget.icon2,
              onPressed: () {
                setState(() {
                  widget.controllador!.text = "";
                  if (controlladorQtd.text.isEmpty &&
                      controllerPreco.text.isEmpty) {
                    serviceContabilizaCaixaStore.valorTotal = "0.00";
                  }
                });
              },
            ),
          ),
        );
      }),
    );
  }
}
