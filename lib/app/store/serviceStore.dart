import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';

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

  @observable
  String? tipoPagamentoValue;
  @observable
  var valorTotal = "0,00";
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
  void setListCountDiario(_value) {
    listaCountDiario.clear();
    for (var i = 0; i < _value.length; i++) {
      listaCountDiario.add(Relatorio.fromJson(_value));
    }
    print("listaCountDiario: ${listaCountDiario.length}");
  }
}

class Relatorio {
  String? valorTotal;
  String? valorUnidade;
  String? quantidade;
  String? formaPagamento;
  String? cliente;
  DateTime? dataDia;

  Relatorio(
      {this.valorTotal,
      this.valorUnidade,
      this.quantidade,
      this.formaPagamento,
      this.cliente,
      this.dataDia});

  Relatorio.fromJson(Map<String, dynamic> json) {
    valorTotal = json['valor_total'];
    valorUnidade = json['valor_unidade'];
    quantidade = json['quantidade'];
    formaPagamento = json['forma_pagamento'];
    cliente = json['cliente'];
    dataDia = json['data_dia'] as DateTime?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valor_total'] = this.valorTotal;
    data['valor_unidade'] = this.valorUnidade;
    data['quantidade'] = this.quantidade;
    data['forma_pagamento'] = this.formaPagamento;
    data['cliente'] = this.cliente;
    data['data_dia'] = this.dataDia;
    return data;
  }
}
