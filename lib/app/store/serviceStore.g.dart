// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serviceStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceStore on _ServiceStoreBase, Store {
  late final _$tipoPagamentoValueAtom =
      Atom(name: '_ServiceStoreBase.tipoPagamentoValue', context: context);

  @override
  String? get tipoPagamentoValue {
    _$tipoPagamentoValueAtom.reportRead();
    return super.tipoPagamentoValue;
  }

  @override
  set tipoPagamentoValue(String? value) {
    _$tipoPagamentoValueAtom.reportWrite(value, super.tipoPagamentoValue, () {
      super.tipoPagamentoValue = value;
    });
  }

  late final _$valorTotalAtom =
      Atom(name: '_ServiceStoreBase.valorTotal', context: context);

  @override
  String get valorTotal {
    _$valorTotalAtom.reportRead();
    return super.valorTotal;
  }

  @override
  set valorTotal(String value) {
    _$valorTotalAtom.reportWrite(value, super.valorTotal, () {
      super.valorTotal = value;
    });
  }

  late final _$valorUnidadeAtom =
      Atom(name: '_ServiceStoreBase.valorUnidade', context: context);

  @override
  String get valorUnidade {
    _$valorUnidadeAtom.reportRead();
    return super.valorUnidade;
  }

  @override
  set valorUnidade(String value) {
    _$valorUnidadeAtom.reportWrite(value, super.valorUnidade, () {
      super.valorUnidade = value;
    });
  }

  late final _$quantidadeAtom =
      Atom(name: '_ServiceStoreBase.quantidade', context: context);

  @override
  int get quantidade {
    _$quantidadeAtom.reportRead();
    return super.quantidade;
  }

  @override
  set quantidade(int value) {
    _$quantidadeAtom.reportWrite(value, super.quantidade, () {
      super.quantidade = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_ServiceStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$_ServiceStoreBaseActionController =
      ActionController(name: '_ServiceStoreBase', context: context);

  @override
  void setLoading(dynamic _value) {
    final _$actionInfo = _$_ServiceStoreBaseActionController.startAction(
        name: '_ServiceStoreBase.setLoading');
    try {
      return super.setLoading(_value);
    } finally {
      _$_ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantidade() {
    final _$actionInfo = _$_ServiceStoreBaseActionController.startAction(
        name: '_ServiceStoreBase.setQuantidade');
    try {
      return super.setQuantidade();
    } finally {
      _$_ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValorUnidade() {
    final _$actionInfo = _$_ServiceStoreBaseActionController.startAction(
        name: '_ServiceStoreBase.setValorUnidade');
    try {
      return super.setValorUnidade();
    } finally {
      _$_ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValorTotal() {
    final _$actionInfo = _$_ServiceStoreBaseActionController.startAction(
        name: '_ServiceStoreBase.setValorTotal');
    try {
      return super.setValorTotal();
    } finally {
      _$_ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTipoPagamento(String value) {
    final _$actionInfo = _$_ServiceStoreBaseActionController.startAction(
        name: '_ServiceStoreBase.setTipoPagamento');
    try {
      return super.setTipoPagamento(value);
    } finally {
      _$_ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListCountDiario(dynamic _value) {
    final _$actionInfo = _$_ServiceStoreBaseActionController.startAction(
        name: '_ServiceStoreBase.setListCountDiario');
    try {
      return super.setListCountDiario(_value);
    } finally {
      _$_ServiceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoPagamentoValue: ${tipoPagamentoValue},
valorTotal: ${valorTotal},
valorUnidade: ${valorUnidade},
quantidade: ${quantidade},
loading: ${loading}
    ''';
  }
}
