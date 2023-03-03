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
