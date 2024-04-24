import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ga_proj/app/services/perfil/configs/store/config_store.dart'; 
import 'package:ga_proj/components/flutter_flow/flutter_flow_icon_button.dart';
import 'package:ga_proj/components/flutter_flow/flutter_flow_widgets.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:go_router/go_router.dart';
 
import 'package:provider/provider.dart';

bool notificationPermission = false;

bool galleryPermission = false;

bool locationPermission = false;

bool cameraPermission = false;

class ConfigsWidget extends StatefulWidget {
  const ConfigsWidget({super.key});

  @override
  _ConfigsWidgetState createState() => _ConfigsWidgetState();
}

class _ConfigsWidgetState extends State<ConfigsWidget> {
  late ConfigStore configsStore;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    configsStore = Provider.of<ConfigStore>(context, listen: false);
    configsStore.updateSwitchStates();
  }

  @override
  void didChangeDependencies() async {
    _initAndroidInfo();
    super.didChangeDependencies();
  }

  void _initAndroidInfo() async {
    try {
      // AndroidDeviceInfo android = await DeviceInfoPlugin().androidInfo;

      if (!mounted) return;

      setState(() {});
    } catch (e) {
      // Lida com qualquer erro ao obter informações do dispositivo
      print('Erro ao obter informações do dispositivo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ThemeModeApp.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: ThemeModeApp.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: ThemeModeApp.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
           context.pop();
          },
        ),
        title: Text(
          'Configurações e permissões',
          style: ThemeModeApp.of(context).bodyLarge.copyWith(
                fontFamily: 'Readex Pro',
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Observer(builder: (_) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Controle de permissões e configurações usadas no Aplicativo.',
                        style: ThemeModeApp.of(context).labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: SwitchListTile.adaptive(
                  value: configsStore.notificationPermission,
                  onChanged: (newValue) async {
                    // requestNotificationPermissions(
                    //     context, newValue);
                  },
                  title: Text(
                    'Envio de Notificações',
                    style: ThemeModeApp.of(context).bodyLarge.copyWith(
                          fontFamily: 'Readex Pro',
                        ),
                  ),
                  subtitle: Text(
                    'Receber notificações dos serviços e andamento de suas solicitações.',
                    style: ThemeModeApp.of(context).bodyMedium.copyWith(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFF8B97A2),
                        ),
                  ),
                  tileColor: ThemeModeApp.of(context).secondaryBackground,
                  activeColor: ThemeModeApp.of(context).primary,
                  activeTrackColor: ThemeModeApp.of(context).accent4,
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 12.0, 24.0, 12.0),
                ),
              ),
              if ((Platform.isAndroid) || Platform.isIOS)
                SwitchListTile.adaptive(
                  value: configsStore.galleryPermission,
                  onChanged: (newValue) async {
                    configsStore.requestGalleryPermissions(context, newValue);
                  },
                  title: Text(
                    'Acesso ao dispositivo',
                    style: ThemeModeApp.of(context).bodyLarge.copyWith(
                          fontFamily: 'Readex Pro',
                        ),
                  ),
                  subtitle: Text(
                    'Usado para envio de fotos, pdf e outros documentos requisitados no sistema',
                    style: ThemeModeApp.of(context).bodyMedium.copyWith(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFF8B97A2),
                        ),
                  ),
                  tileColor: ThemeModeApp.of(context).secondaryBackground,
                  activeColor: ThemeModeApp.of(context).primary,
                  activeTrackColor: ThemeModeApp.of(context).accent4,
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 12.0, 24.0, 12.0),
                ),
              SwitchListTile.adaptive(
                value: configsStore.locationPermission,
                onChanged: (newValue) async {
                  configsStore.requestLocationPermissions(context, newValue);
                },
                title: Text(
                  'Localização',
                  style: ThemeModeApp.of(context).bodyLarge.copyWith(
                        fontFamily: 'Readex Pro',
                      ),
                ),
                subtitle: Text(
                  'Usado para localizar os serviços mais próximos de você.',
                  style: ThemeModeApp.of(context).bodyMedium.copyWith(
                        fontFamily: 'Readex Pro',
                        color: const Color(0xFF8B97A2),
                      ),
                ),
                tileColor: ThemeModeApp.of(context).secondaryBackground,
                activeColor: ThemeModeApp.of(context).primary,
                activeTrackColor: ThemeModeApp.of(context).accent4,
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                    24.0, 12.0, 24.0, 12.0),
              ),
              SwitchListTile.adaptive(
                value: configsStore.cameraPermission,
                onChanged: (newValue) async {
                  configsStore.requestCameraPermissions(context, newValue);
                },
                title: Text(
                  'Câmera',
                  style: ThemeModeApp.of(context).bodyLarge.copyWith(
                        fontFamily: 'Readex Pro',
                      ),
                ),
                subtitle: Text(
                  'Usado para capturar fotos e vídeos em seus serviços.',
                  style: ThemeModeApp.of(context).bodyMedium.copyWith(
                        fontFamily: 'Readex Pro',
                        color: const Color(0xFF8B97A2),
                      ),
                ),
                tileColor: ThemeModeApp.of(context).secondaryBackground,
                activeColor: ThemeModeApp.of(context).primary,
                activeTrackColor: ThemeModeApp.of(context).accent4,
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                    24.0, 12.0, 24.0, 12.0),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Salvar ',
                  options: FFButtonOptions(
                    width: 190.0,
                    height: 50.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    color: ThemeModeApp.of(context).primary,
                    textStyle:
                        ThemeModeApp.of(context).titleSmall.copyWith(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                            ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
