// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:mobx/mobx.dart';

import '../../models/cliente.dart';
import '../services/services_functions.dart';

part 'serviceStore.g.dart';

var controlladorValor = TextEditingController();
var controlladorQtd = TextEditingController();
TextEditingController controlladorCliente = TextEditingController();
final MoneyMaskedTextController controllerPreco = MoneyMaskedTextController(
  decimalSeparator: ',', // definir o separador decimal para vírgula
  thousandSeparator: '.', // definir o separador de milhares para ponto
  initialValue: 0, // definir o valor inicial do campo de texto
);

class ServiceStore = _ServiceStoreBase with _$ServiceStore;

abstract class _ServiceStoreBase with Store {
  ObservableList<Relatorio> listaCountDiario = ObservableList<Relatorio>();
  ObservableList<Cliente> listaClientes = ObservableList<Cliente>();

  // Define as horas de início e fim do expediente do trabalhador
  int startHour = 8;
  int endHour = 19;

  // Calcula a quantidade de minutos que se passaram desde o início do expediente
  var totalMinutes = 0;
  // Calcula a quantidade total de minutos do expediente
  int totalWorkMinutes = 0;
  // Calcula a porcentagem do tempo atual em relação ao expediente total
  double percentage = 0.0;

  @observable
  String? tipoPagamentoValue;
  @observable
  var valorTotal = "0,00";
  @observable
  double valorVendasHoje = 0.0;
  @observable
  var valorUnidade = "0,00";
  @observable
  int quantidade = 0;
  @observable
  bool loading = false;

  @action
  void setLoading(_value) {
    loading = _value;
  }

  @action
  void setQuantidade() {
    quantidade = quantidade = int.parse(controlladorQtd.text);
  }

  @action
  void setValorUnidade() {
    valorUnidade = controllerPreco.text;
  }

  @action
  void setValorTotal() {
    if (controlladorQtd.text.isNotEmpty && controllerPreco.text.isNotEmpty) {
      valorTotal =
          (double.parse(valorUnidade.replaceAll(".", "").replaceAll(",", ".")) *
                  double.parse(quantidade.toString()))
              .toStringAsFixed(2)
              .replaceAll(".", ",");
    } else {
      valorTotal = "0,00";
    }
    print(valorTotal);
  }

  @action
  void setTipoPagamento(String value) {
    tipoPagamentoValue = value;
  }

  @action
  Future<void> setListCountDiario(_value) async {
    listaCountDiario.clear();
    for (var i = 0; i < _value.length; i++) {
      if (_value == 0) {
        if (_value[i]["data_dia"] == DateTime.now().day.toString()) {
          print("diasss: ${_value["data_dia"]}");
          listaCountDiario.add(Relatorio.fromMap(_value));
          var valor =
              _value["valor_total"].replaceAll(".", "").replaceAll(",", ".");
          print("Valorrr::::: $valor");
          valorVendasHoje = valorVendasHoje + double.parse(valor.toString());
        }
      } else if (_value[i]["data_dia"] == DateTime.now().day.toString()) {
        print("diasss: ${_value[i]["data_dia"]}");
        listaCountDiario.add(Relatorio.fromMap(_value[i]));
        var valor =
            _value[i]["valor_total"].replaceAll(".", "").replaceAll(",", ".");
        print("Valorrr::::: $valor");
        valorVendasHoje = valorVendasHoje + double.parse(valor.toString());
      }

      //
    }
    print("listaCountDiario: ${listaCountDiario.length}");
    // await setValorVendasHoje();
  }

  Future<void> setPercentHours() async {
    // Calcula a quantidade de minutos que se passaram desde o início do expediente
    totalMinutes = (DateTime.now().hour.toInt() - startHour) * 60 +
        DateTime.now().minute.toInt();
    // Calcula a quantidade total de minutos do expediente
    totalWorkMinutes = (endHour - startHour) * 60;
    // Calcula a porcentagem do tempo atual em relação ao expediente total
    percentage = (totalMinutes / totalWorkMinutes) * 100;
  }
}

class Relatorio {
  String? valorTotal;
  String? valorUnidade;
  int? quantidade;
  String? formaPagamento;
  String? cliente;
  String? dataDia;
  String? rua;
  String? numero;

  String? bairro;
  String? cidade;
  String? estado;
  Relatorio({
    this.valorTotal,
    this.valorUnidade,
    this.quantidade,
    this.formaPagamento,
    this.cliente,
    this.dataDia,
    this.rua,
    this.numero,
    this.bairro,
    this.cidade,
    this.estado,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'valorTotal': valorTotal,
      'valorUnidade': valorUnidade,
      'quantidade': quantidade,
      'formaPagamento': formaPagamento,
      'cliente': cliente,
      'dataDia': dataDia,
      'rua': rua,
      'numero': numero,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
    };
  }

  factory Relatorio.fromMap(map) {
    return Relatorio(
      valorTotal:
          map['valor_total'] != null ? map['valor_total'] as String : null,
      valorUnidade:
          map['valor_unidade'] != null ? map['valor_unidade'] as String : null,
      quantidade: map['quantidade'] != null ? map['quantidade'] as int : null,
      formaPagamento: map['forma_pagamento'] != null
          ? map['forma_pagamento'] as String
          : null,
      cliente: map['nome'] != null ? map['nome'] as String : null,
      dataDia: map['data_dia'] != null ? map['data_dia'] as String : null,
      rua: map['rua'] != null ? map['rua'] as String : null,
      numero: map['numero'] != null ? map['numero'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      cidade: map['cidade'] != null ? map['cidade'] as String : null,
      estado: map['estado'] != null ? map['estado'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Relatorio.fromJson(String source) =>
      Relatorio.fromMap(json.decode(source) as Map<String, dynamic>);
}
