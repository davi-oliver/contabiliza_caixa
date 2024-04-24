// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfigStore on _ConfigStoreBase, Store {
  late final _$notificationPermissionAtom =
      Atom(name: '_ConfigStoreBase.notificationPermission', context: context);

  @override
  bool get notificationPermission {
    _$notificationPermissionAtom.reportRead();
    return super.notificationPermission;
  }

  @override
  set notificationPermission(bool value) {
    _$notificationPermissionAtom
        .reportWrite(value, super.notificationPermission, () {
      super.notificationPermission = value;
    });
  }

  late final _$galleryPermissionAtom =
      Atom(name: '_ConfigStoreBase.galleryPermission', context: context);

  @override
  bool get galleryPermission {
    _$galleryPermissionAtom.reportRead();
    return super.galleryPermission;
  }

  @override
  set galleryPermission(bool value) {
    _$galleryPermissionAtom.reportWrite(value, super.galleryPermission, () {
      super.galleryPermission = value;
    });
  }

  late final _$locationPermissionAtom =
      Atom(name: '_ConfigStoreBase.locationPermission', context: context);

  @override
  bool get locationPermission {
    _$locationPermissionAtom.reportRead();
    return super.locationPermission;
  }

  @override
  set locationPermission(bool value) {
    _$locationPermissionAtom.reportWrite(value, super.locationPermission, () {
      super.locationPermission = value;
    });
  }

  late final _$cameraPermissionAtom =
      Atom(name: '_ConfigStoreBase.cameraPermission', context: context);

  @override
  bool get cameraPermission {
    _$cameraPermissionAtom.reportRead();
    return super.cameraPermission;
  }

  @override
  set cameraPermission(bool value) {
    _$cameraPermissionAtom.reportWrite(value, super.cameraPermission, () {
      super.cameraPermission = value;
    });
  }

  late final _$updateSwitchStatesAsyncAction =
      AsyncAction('_ConfigStoreBase.updateSwitchStates', context: context);

  @override
  Future<void> updateSwitchStates() {
    return _$updateSwitchStatesAsyncAction
        .run(() => super.updateSwitchStates());
  }

  late final _$requestNotificationPermissionsAsyncAction = AsyncAction(
      '_ConfigStoreBase.requestNotificationPermissions',
      context: context);

  @override
  Future<void> requestNotificationPermissions(
      BuildContext context, bool newValue) {
    return _$requestNotificationPermissionsAsyncAction
        .run(() => super.requestNotificationPermissions(context, newValue));
  }

  late final _$requestGalleryPermissionsAsyncAction = AsyncAction(
      '_ConfigStoreBase.requestGalleryPermissions',
      context: context);

  @override
  Future<void> requestGalleryPermissions(BuildContext context, bool newValue) {
    return _$requestGalleryPermissionsAsyncAction
        .run(() => super.requestGalleryPermissions(context, newValue));
  }

  late final _$requestLocationPermissionsAsyncAction = AsyncAction(
      '_ConfigStoreBase.requestLocationPermissions',
      context: context);

  @override
  Future<void> requestLocationPermissions(BuildContext context, bool newValue) {
    return _$requestLocationPermissionsAsyncAction
        .run(() => super.requestLocationPermissions(context, newValue));
  }

  late final _$requestCameraPermissionsAsyncAction = AsyncAction(
      '_ConfigStoreBase.requestCameraPermissions',
      context: context);

  @override
  Future<dynamic> requestCameraPermissions(dynamic context, dynamic value) {
    return _$requestCameraPermissionsAsyncAction
        .run(() => super.requestCameraPermissions(context, value));
  }

  @override
  String toString() {
    return '''
notificationPermission: ${notificationPermission},
galleryPermission: ${galleryPermission},
locationPermission: ${locationPermission},
cameraPermission: ${cameraPermission}
    ''';
  }
}
