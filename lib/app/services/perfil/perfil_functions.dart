// import 'dart:convert';
// import 'dart:developer';
 
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
 

class PerfilFunctions {
  BuildContext context;
  PerfilFunctions(this.context);

  Future updateSenha() async {
    // final globalsUserInformations =
    //     Provider.of<GlobalsUserInformations>(context, listen: false);
    // final globalsStore = Provider.of<GlobalsStore>(context, listen: false);
    // final perfilStore = Provider.of<PerfilStore>(context, listen: false);

    print("ETNROU NO UPDATE SENHA!!!!!!!!!");

    // if (!(await GlobalsFunctions().verificaInternet())) {
    //   try {
    //     /*if (loginStore.armazenaLogin) {
    //       escreveArmazenamentologin();
    //     } else {
    //       apagaArmazenamentoLogin();
    //     }*/

    //     var response = await http.patch(
    //       Uri.parse("${GlobalsAppInformations().urlEndPoint}/auth/login"),
    //       headers: {
    //         "Authorization": "Bearer ${globalsUserInformations.accessToken}"
    //       },
    //       body: {
    //         "login": globalsUserInformations.login,
    //         "password": perfilStore.controllerUpdateSenha.text,
    //       },
    //     );

    //     var jsonResponse = await json.decode(response.body);
    //     if ("${jsonResponse['message']}" == "Senha atualizada com sucesso") {
    //       globalsStore.setCarregandoPagina(false);
    //       GlobalsAlerts(context).alertSucesso("${jsonResponse['message']}", () {
    //         perfilStore.controllerUpdateSenha.clear();
    //         perfilStore.controllerUpdateSenha.clear();
    //         Navigator.of(context).pop();
    //       });
    //     }

    //     return true;
    //   } catch (e) {
    //     log("ERRO >> $e ");
    //     GlobalsAlerts(context)
    //         .alertErro(GlobalsAppInformations().menssagemErroRequisicao, () {
    //       Navigator.of(context, rootNavigator: true).pop();
    //     });

    //     return false;
    //   }
    // } else {
    //   GlobalsAlerts(context)
    //       .alertErro(GlobalsAppInformations().menssagemSemInternet, () {
    //     Navigator.of(context, rootNavigator: true).pop();
    //   });

    //   return false;
    // }
  }
}
