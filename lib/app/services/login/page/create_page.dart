import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ga_proj/app/services/login/widget/widgets.dart';
import 'package:ga_proj/global/globals_widgets.dart';
import 'package:ga_proj/global/store/global_store.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:provider/provider.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
   bool loading = false;
  bool initialized = false;

  late GlobalStore globalStore;

  @override
  void didChangeDependencies() {
    globalStore = Provider.of<GlobalStore>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ThemeModeApp.of(context).primaryBackground,
        resizeToAvoidBottomInset: true,
        body: Stack(
          //usado para que o carregamento feito depois que a página foi aberta fique sempre por cima
          children: [
            loading //verificador para ficar na tela de loading enquanto a pagina esta sendo carregada
                ? GlobalsWidgets(context).loadingPage(
                    MediaQuery.of(context).size.height,
                    MediaQuery.of(context).size.width)
                : LoginWidgets(context).widgetCreateAccount(),

            // loading usado para quando precisar de um carregamento depois que a página já foi aberta, assim, não é possivel usar o setState no carregando
            // e não é interessante usar Observer na raiz, já que faria toda a página ser carregada toda vez que qqr action for chamada
            Observer(
              builder: (_) {
                return Visibility(
                  visible: globalStore.loading,
                  child: GlobalsWidgets(context).loadingPage(
                    MediaQuery.of(context).size.height,
                    MediaQuery.of(context).size.width,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}