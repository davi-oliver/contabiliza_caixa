import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:ga_proj/app/store/serviceStore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

var valorTotal = "0,00";

class ServicesFunctions {
  BuildContext context;
  ServicesFunctions(this.context);
  Future<void> setPathVenda() async {
    final _store = context.read<ServiceStore>();
    final file = await LocalPath().localEpModificacao;
    // await file.delete();
    if (await file.exists()) {
      print("Arquivo existe");
      print(await file.readAsString());
      List listaLocal = [];
      var _aux = jsonDecode(await file.readAsString());
      print("aux: $_aux");
      if (_aux is List) {
        print("aux is list");
        if (_aux.length > 0) {
          for (var i = 0; i < _aux.length; i++) {
            print("aasadskljajsdalk ${_aux[i]}");
            if (_aux[i] != null) {
              listaLocal.add(_aux[i]);
            }
          }
        }
      } else {
        listaLocal.add(_aux);
      }

      final _json = {
        "valor_total": _store.valorTotal,
        "valor_unidade": _store.valorUnidade,
        "quantidade": _store.quantidade,
        "forma_pagamento": _store.tipoPagamentoValue,
        "cliente": controlladorCliente.text,
        "data_dia": DateTime.now().toString()
      };
      listaLocal.add(_json);
      await file.writeAsString(jsonEncode(listaLocal));
      print(
          "Dados salvos no arquivo: ${jsonDecode(await file.readAsString())}");
    } else {
      final _json = {
        "valor_total": _store.valorTotal,
        "valor_unidade": _store.valorUnidade,
        "quantidade": _store.quantidade,
        "forma_pagamento": _store.tipoPagamentoValue,
        "cliente": controlladorCliente.text,
        "data_dia": DateTime.now().toString()
      };
      print("jsonMontado? $_json  ");
      await file.writeAsString(jsonEncode(_json));
      print(
          "Dados salvos no arquivo: ${jsonDecode(await file.readAsString())}");
    }
  }
}

class LocalPath {
  Future<String> get _localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get localEpModificacao async {
    final path = await _localPath;
    return File('$path/modificacao.txt');
  }
}
