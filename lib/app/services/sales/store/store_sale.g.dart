// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_sale.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SaleStore on _SaleStoreBase, Store {
  late final _$listItensPaymentAtom =
      Atom(name: '_SaleStoreBase.listItensPayment', context: context);

  @override
  ObservableList<ItemType> get listItensPayment {
    _$listItensPaymentAtom.reportRead();
    return super.listItensPayment;
  }

  @override
  set listItensPayment(ObservableList<ItemType> value) {
    _$listItensPaymentAtom.reportWrite(value, super.listItensPayment, () {
      super.listItensPayment = value;
    });
  }

  late final _$listItensProductAtom =
      Atom(name: '_SaleStoreBase.listItensProduct', context: context);

  @override
  ObservableList<Product> get listItensProduct {
    _$listItensProductAtom.reportRead();
    return super.listItensProduct;
  }

  @override
  set listItensProduct(ObservableList<Product> value) {
    _$listItensProductAtom.reportWrite(value, super.listItensProduct, () {
      super.listItensProduct = value;
    });
  }

  late final _$listSaleDayAtom =
      Atom(name: '_SaleStoreBase.listSaleDay', context: context);

  @override
  ObservableList<SaleModel> get listSaleDay {
    _$listSaleDayAtom.reportRead();
    return super.listSaleDay;
  }

  @override
  set listSaleDay(ObservableList<SaleModel> value) {
    _$listSaleDayAtom.reportWrite(value, super.listSaleDay, () {
      super.listSaleDay = value;
    });
  }

  late final _$listSaleMounthAtom =
      Atom(name: '_SaleStoreBase.listSaleMounth', context: context);

  @override
  ObservableList<SaleModel> get listSaleMounth {
    _$listSaleMounthAtom.reportRead();
    return super.listSaleMounth;
  }

  @override
  set listSaleMounth(ObservableList<SaleModel> value) {
    _$listSaleMounthAtom.reportWrite(value, super.listSaleMounth, () {
      super.listSaleMounth = value;
    });
  }

  late final _$itemSelectedProductAtom =
      Atom(name: '_SaleStoreBase.itemSelectedProduct', context: context);

  @override
  dynamic get itemSelectedProduct {
    _$itemSelectedProductAtom.reportRead();
    return super.itemSelectedProduct;
  }

  @override
  set itemSelectedProduct(dynamic value) {
    _$itemSelectedProductAtom.reportWrite(value, super.itemSelectedProduct, () {
      super.itemSelectedProduct = value;
    });
  }

  late final _$_SaleStoreBaseActionController =
      ActionController(name: '_SaleStoreBase', context: context);

  @override
  void addListSaleMounth(SaleModel item) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.addListSaleMounth');
    try {
      return super.addListSaleMounth(item);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addListSaleDay(SaleModel item) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.addListSaleDay');
    try {
      return super.addListSaleDay(item);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addListItensProduct(Product item) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.addListItensProduct');
    try {
      return super.addListItensProduct(item);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addListItensPayment(ItemType item) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.addListItensPayment');
    try {
      return super.addListItensPayment(item);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItemSelectedPayment(ItemType item) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setItemSelectedPayment');
    try {
      return super.setItemSelectedPayment(item);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItemSelectedProduct(Product item) {
    final _$actionInfo = _$_SaleStoreBaseActionController.startAction(
        name: '_SaleStoreBase.setItemSelectedProduct');
    try {
      return super.setItemSelectedProduct(item);
    } finally {
      _$_SaleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listItensPayment: ${listItensPayment},
listItensProduct: ${listItensProduct},
listSaleDay: ${listSaleDay},
listSaleMounth: ${listSaleMounth},
itemSelectedProduct: ${itemSelectedProduct}
    ''';
  }
}
