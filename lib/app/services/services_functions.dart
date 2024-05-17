// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ga_proj/app/local/local_storage.dart';
import 'package:ga_proj/app/services/company/store/companies_store.dart';
import 'package:ga_proj/app/services/sales/store/store_sale.dart';
import 'package:ga_proj/app/store/serviceStore.dart';
import 'package:ga_proj/backend/datasource/results.dart';
import 'package:ga_proj/backend/db/api/get/get.supabase.service.dart';
import 'package:ga_proj/global/globals_alert.dart';
import 'package:ga_proj/models/product.dart';
import 'package:ga_proj/models/sale.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

var valorTotal = "0,00";

class ServicesFunctions {
  BuildContext context;
  ServicesFunctions(this.context);

  Future initPage() async {
    final store = Provider.of<SaleStore>(context, listen: false);
 

    store.itemSelectedPayment = null;
    store.itemSelectedProduct = null;

   
      store.listItensProduct.clear();
      var rep = await GetSupaBaseApi().findProductAll();

      if (rep is List<Map<String, dynamic>>) {
        for (var element in rep) {
          Product item = Product.fromJson(element);
          store.addListItensProduct(item);
        }
         
        // log local
        log(name: "GET PRODUCT local", rep.toString());
      } else {
        log(
            name: "GET PRODUCT",
            "Erro ao buscar dados ${rep.runtimeType.toString()}");
      }
      log(name: "Store Product", store.listItensProduct.length.toString());

   
   


     

    
  }

  Future findAllSaleDay () async {

    final store = Provider.of<SaleStore>(context, listen: false);
    // remove hour in date 
    var data = DateTime.now().toString().split(" ")[0];
    var mounth = DateTime.now().toString().split(" ")[0];
    mounth =  mounth.split("-")[1];


    log(name: "Mounth", mounth);
    var rep = await GetSupaBaseApi().findSaleByDate(data);
    var repMounth = await GetSupaBaseApi().findSaleByMounth(mounth);
    store.listSaleDay.clear();
    store.listSaleMounth.clear();

    if (rep is List<Map<String, dynamic>>) {
      for (var element in rep) {
        SaleModel item = SaleModel.fromJson(element);
        store.addListSaleDay(item);
      }
      // log local
      log(name: "GET SALE listSale lenght",  store.listSaleDay.length.toString());
    } else {
      log(
          name: "GET SALE",
          "Erro ao buscar dados ${rep.runtimeType.toString()}");
    }

  

    if (repMounth != null ) {
      for (var element in repMounth) {
        SaleModel item = SaleModel.fromJson(element);
        store.addListSaleMounth(item);
      }
      // log local
      log(name: "GET SALE listSale lenght",  store.listSaleMounth.length.toString());
    } else {
      log(
          name: "GET SALE",
          "Erro ao buscar dados ${repMounth.runtimeType.toString()}");
    }
    


  }

  Future createSale({
    String valorTotal = "0,00",
    String valorUnidade = "0,00",
    String quantidade = "0",
    int productId = 0,
    int pagamentoId = 0,
    String cliente = "0",
  }) async {
    // parse to double valorTotal
    valorTotal = valorTotal.replaceAll(".", "").replaceAll(",", ".");
    valorUnidade = valorUnidade.replaceAll(".", "").replaceAll(",", ".");
    // parse to double valor total
    var total = double.parse(valorTotal);
    var price = double.parse(valorUnidade);

    // parse int quantidade
    quantidade = quantidade.replaceAll(".", "").replaceAll(",", ".");
    var qtd = int.parse(quantidade);


    // validade if cliente exist
    final resp = await GetSupaBaseApi().findByNameCompany({"name": cliente});

    // if client not exist create client
    if (resp.length == 0) {
       await GetSupaBaseApi().createCompany({"name": cliente});
    
    }

    // get id client[
    final resp3 = await GetSupaBaseApi().findByNameCompany({"name": cliente});
    int idClient = resp3[0]["id"];
    // get geolocation
    Position? _position = await _getCurrentLocalization();
    var lat, long;
    lat = _position?.latitude;
    long = _position?.longitude;

    // create sale
    final resp4 = await GetSupaBaseApi().createSale({
      "total": total,
      "price": price,
      "quantity": qtd,
      "payment_type": pagamentoId,
      "cliente": idClient,
      "user_id": 1,
      "product_id": productId,
      "geo": "$lat,$long"
    });

    log(name: "CREATE SALE", resp4.toString());

    if (resp4 == null) {
      log(name: "CREATE SALE", "Venda criada com sucesso");
      return Results(sucess: true);
    } else {
      log(name: "CREATE SALE", "Erro ao criar venda");
      return Results(sucess: false, message: "Erro ao criar venda");
    }
  }

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
