// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$selectedMenuItemAtom =
      Atom(name: '_HomeStoreBase.selectedMenuItem', context: context);

  @override
  int get selectedMenuItem {
    _$selectedMenuItemAtom.reportRead();
    return super.selectedMenuItem;
  }

  @override
  set selectedMenuItem(int value) {
    _$selectedMenuItemAtom.reportWrite(value, super.selectedMenuItem, () {
      super.selectedMenuItem = value;
    });
  }

  late final _$visibilityNotificationAtom =
      Atom(name: '_HomeStoreBase.visibilityNotification', context: context);

  @override
  bool get visibilityNotification {
    _$visibilityNotificationAtom.reportRead();
    return super.visibilityNotification;
  }

  @override
  set visibilityNotification(bool value) {
    _$visibilityNotificationAtom
        .reportWrite(value, super.visibilityNotification, () {
      super.visibilityNotification = value;
    });
  }

  late final _$visibilityProfileAtom =
      Atom(name: '_HomeStoreBase.visibilityProfile', context: context);

  @override
  bool get visibilityProfile {
    _$visibilityProfileAtom.reportRead();
    return super.visibilityProfile;
  }

  @override
  set visibilityProfile(bool value) {
    _$visibilityProfileAtom.reportWrite(value, super.visibilityProfile, () {
      super.visibilityProfile = value;
    });
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  void setSelectedMenuItem(int value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setSelectedMenuItem');
    try {
      return super.setSelectedMenuItem(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVisibilityNotification(bool value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setVisibilityNotification');
    try {
      return super.setVisibilityNotification(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVisibilityProfile(bool value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setVisibilityProfile');
    try {
      return super.setVisibilityProfile(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedMenuItem: ${selectedMenuItem},
visibilityNotification: ${visibilityNotification},
visibilityProfile: ${visibilityProfile}
    ''';
  }
}
