// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ga_proj/app/store/serviceStore.dart';
import 'package:ga_proj/global/globals_alert.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

var valorTotal = "0,00";

class ServicesFunctions {
  BuildContext context;
  ServicesFunctions(this.context);

  Future _getCurrentLocalization() async {
    LocationPermission _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied ||
        _permission == LocationPermission.deniedForever) {
      context.read<ServiceStore>().setLoading(false);
      await GlobalsAlert(context).alertErroGeo(
          "Atenção\n Permissão de Localização Negada\n",
          "Permissão de Localização Negada. Abra a guia de configurações do aplicativo e habilite a permissão de localização.");

      return;
    }

    Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy
                .high /*,
            forceAndroidLocationManager: true*/
            );
        
    return position;
  }

  Future<void> setPathVenda() async {
    final _store = context.read<ServiceStore>();
    final file = await LocalPath().localVendas;

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

      Position? _position = await _getCurrentLocalization();
      var lat, long;
      lat = _position?.latitude;
      long = _position?.longitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
      Placemark placemark = placemarks[0];
      var _json = {
        "valor_total": _store.valorTotal,
        "valor_unidade": _store.valorUnidade,
        "quantidade": _store.quantidade,
        "forma_pagamento": _store.tipoPagamentoValue,
        "nome": controlladorCliente.text,
        "rua": placemark.street,
        "cidade": placemark.locality,
        "bairro": placemark.subLocality,
        "estado": placemark.administrativeArea,
        "data_dia": DateTime.now().day.toString()
      };

      listaLocal.add(_json);
      await file.writeAsString(jsonEncode(listaLocal));
      print(
          "Dados salvos no arquivo: ${jsonDecode(await file.readAsString())}");
      return await GlobalsAlert(context)
          .alertSucesso("Pronto", "Venda salva com sucesso");
    } else {
      Position? _position = await _getCurrentLocalization();
      var lat, long;
      lat = _position?.latitude;
      long = _position?.longitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
      Placemark placemark = placemarks[0];
      var _json = {
        "valor_total": _store.valorTotal,
        "valor_unidade": _store.valorUnidade,
        "quantidade": _store.quantidade,
        "forma_pagamento": _store.tipoPagamentoValue,
        "nome": controlladorCliente.text,
        "rua": placemark.street,
        "cidade": placemark.locality,
        "bairro": placemark.subLocality,
        "estado": placemark.administrativeArea,
        "data_dia": DateTime.now().day.toString()
      };

      print("jsonMontado? $_json  ");
      await file.writeAsString(jsonEncode(_json));
      print(
          "Dados salvos no arquivo: ${jsonDecode(await file.readAsString())}");
      return await GlobalsAlert(context)
          .alertSucesso("Pronto", "Venda salva com sucesso");
    }
  }
}

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
}
