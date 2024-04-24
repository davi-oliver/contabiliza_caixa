// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ga_proj/global/globals_alert.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart'; 
part 'config_store.g.dart';

class ConfigStore = _ConfigStoreBase with _$ConfigStore;

abstract class _ConfigStoreBase with Store {
  @observable
  bool notificationPermission = false;

  @observable
  bool galleryPermission = false;

  @observable
  bool locationPermission = false;

  @observable
  bool cameraPermission = false;

  @action
  Future<void> updateSwitchStates() async {
    final PermissionStatus notificationStatus =
        await Permission.notification.status;
    notificationPermission = notificationStatus.isGranted;

    final PermissionStatus galleryStatus = await Permission.storage.status;
    galleryPermission = galleryStatus.isGranted;

    final PermissionStatus locationStatus = await Permission.location.status;
    locationPermission = locationStatus.isGranted;

    final PermissionStatus cameraStatus = await Permission.camera.status;
    cameraPermission = cameraStatus.isGranted;
  }

  @action
  Future<void> requestNotificationPermissions(
      BuildContext context, bool newValue) async {
    if (newValue) {
      final PermissionStatus status = await Permission.notification.request();
      notificationPermission = status.isGranted;

      if (status.isGranted) {
        // Permissão concedida
        print('Permissão de notificações concedida!');
      } else if (status.isDenied) {
        // Permissão negada
        GlobalsAlert(context).alertError(
          text:
              'As notificações são importantes para manter você informado sobre os serviços e andamento de suas solicitações. Deseja habilitar a permissão?',
          ontap: openAppSettings,
        );
      } else {
        // Permissão negada permanentemente
        GlobalsAlert(context).alertError(
          text:
              'As notificações são importantes para manter você informado sobre os serviços e andamento de suas solicitações. Deseja habilitar a permissão?',
          ontap: openAppSettings,
        );
      }
    } else {
      // O usuário está desabilitando a permissão
      GlobalsAlert(context).alertError(
          text:
              "Desabilitar as notificações pode resultar em falta de informações importantes sobre os serviços e andamento de suas solicitações. Deseja continuar?",
          ontap: () {
            openAppSettings();
          });
    }
  }

  @action
  Future<void> requestGalleryPermissions(
      BuildContext context, bool newValue) async {
    if (newValue) {
      final PermissionStatus status = await Permission.storage.request();
      galleryPermission = status.isGranted;

      if (status.isGranted) {
        // Permissão concedida
        print('Permissão de acesso à galeria e documentos concedida!');
      } else if (status.isDenied) {
        // Permissão negada, solicite manualmente
        GlobalsAlert(context).alertError(
          text:
              'O acesso à galeria e documentos é necessário para enviar fotos, PDFs e outros documentos requeridos no sistema. Deseja habilitar a permissão?',
          ontap: openAppSettings,
        );
      } else {
        // Permissão negada permanentemente, informe o usuário
        GlobalsAlert(context).alertError(
          text:
              'O acesso à galeria e documentos é necessário para enviar fotos, PDFs e outros documentos requeridos no sistema. Deseja habilitar a permissão?',
          ontap: openAppSettings,
        );
      }
    } else {
      // O usuário está desabilitando a permissão
      GlobalsAlert(context).alertError(
        text:
            'Desabilitar o acesso à galeria e documentos pode impedir que você envie fotos, PDFs e outros documentos necessários no sistema. Deseja continuar?',
        ontap: () {
          openAppSettings();
        },
      );
    }
  }

  @action
  Future<void> requestLocationPermissions(
      BuildContext context, bool newValue) async {
    if (newValue) {
      final PermissionStatus status = await Permission.location.request();
      locationPermission = status.isGranted;

      if (status.isGranted) {
        // Permissão concedida
        print('Permissão de acesso à localização concedida!');
      } else if (status.isDenied) {
        // Permissão negada, solicite manualmente
        GlobalsAlert(context).alertError(
          text:
              'A localização é usada para fornecer serviços com base na sua localização atual, garantindo uma experiência personalizada e precisa. Deseja habilitar a permissão?',
          ontap: openAppSettings,
        );
      } else {
        // Permissão negada permanentemente, informe o usuário
        GlobalsAlert(context).alertError(
          text:
              'A localização é usada para fornecer serviços com base na sua localização atual, garantindo uma experiência personalizada e precisa. Deseja habilitar a permissão?',
          ontap: openAppSettings,
        );
      }
    } else {
      // O usuário está desabilitando a permissão
      GlobalsAlert(context).alertError(
        text:
            'Desabilitar o acesso à localização pode afetar a precisão ou a disponibilidade dos serviços de solicitação. Esses serviços podem depender da sua localização atual para oferecer a melhor experiência possível. Deseja continuar?',
        ontap: () {
          openAppSettings();
        },
      );
    }
  }

  // requestPermisson Camera

  @action
  Future requestCameraPermissions(context, value) async {
    final PermissionStatus status = await Permission.camera.request();
    cameraPermission = status.isGranted;
    if (value) {
      if (status.isGranted) {
        // Permissão concedida
        print('Permissão de acesso à camera concedida!');
      } else if (status.isDenied) {
        // Permissão negada, solicite manualmente
        print('Permissão de acesso à camera negada!');
        GlobalsAlert(context).alertError(
          text:
              'A localização é usada para fornecer serviços com base na sua localização atual, garantindo uma experiência personalizada e precisa. Deseja habilitar a permissão?',
          ontap: openAppSettings,
        );
      }
    } else {
      // Permissão negada permanentemente, informe o usuário
      print('Permissão de acesso à camera negada permanentemente!');
      GlobalsAlert(context).alertError(
        text:
            'Desbilitar a permissão de câmera permante, irá impossibilita-lo de anexar imagens durante o uso do aplicativo. Deseja habilitar a permissão?',
        ontap: openAppSettings,
      );
    }
  }
}
