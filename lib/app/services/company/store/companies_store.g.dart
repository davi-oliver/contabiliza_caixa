// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CompaniesStore on _CompaniesStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: '_CompaniesStoreBase.loading', context: context);

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

  late final _$_CompaniesStoreBaseActionController =
      ActionController(name: '_CompaniesStoreBase', context: context);

  @override
  void setLoading(dynamic v) {
    final _$actionInfo = _$_CompaniesStoreBaseActionController.startAction(
        name: '_CompaniesStoreBase.setLoading');
    try {
      return super.setLoading(v);
    } finally {
      _$_CompaniesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
