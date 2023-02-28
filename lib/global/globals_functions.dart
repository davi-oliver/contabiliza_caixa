import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class GlobalsFunctions {
  // declare build context
  BuildContext context;
  GlobalsFunctions(this.context);
  Future<bool> verificaInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // nao tem conexao
      return false;
    }
    // tem conexao
    return true;
  }
}
