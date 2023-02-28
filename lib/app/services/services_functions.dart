import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:path_provider/path_provider.dart';

TextEditingController controlladorValor = TextEditingController();
TextEditingController controlladorQtd = TextEditingController();
TextEditingController controlladorCliente = TextEditingController();
final MoneyMaskedTextController controllerPreco = MoneyMaskedTextController(
  decimalSeparator: ',', // definir o separador decimal para vírgula
  thousandSeparator: '.', // definir o separador de milhares para ponto
  initialValue: 0, // definir o valor inicial do campo de texto
);
var valorTotal = "0,00";

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
