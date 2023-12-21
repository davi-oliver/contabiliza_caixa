
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LocalPath {
  Future<String> get _localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get localVendas async {
    final path = await _localPath;
    return File('$path/vendas.txt');
  }

  Future<File> get localCliente async {
    final path = await _localPath;
    return File('$path/clients.txt');
  }
  // local payment 
  Future<File> get localPayment async {
    final path = await _localPath;
    return File('$path/payment.txt');
  }
  // local product
  Future<File> get localProduct async {
    final path = await _localPath;
    return File('$path/product.txt');
  }

  
}