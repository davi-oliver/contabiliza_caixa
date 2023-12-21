import 'package:flutter/material.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:ga_proj/app/services/home/home_page.dart';
import 'package:ga_proj/global/globals_fonts.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
 
import 'package:geolocator/geolocator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GlobalsAlert {
  BuildContext context;
  GlobalsAlert(this.context);
  alertErroGeo(
    titulo,
    texto,
  ) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: true,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: ThemeModeApp.of(context).titleSmall,
      overlayColor: const Color(0x55000000),
    );
    Alert(
      context: context,
      style: alertStyle,
      closeIcon: Icon(
        Icons.close,
        color: Colors.black,
      ),
      title: titulo,
      content: Column(
        children: [
          Text(texto,
              style:
                 ThemeModeApp.of(context).headlineMedium),
        ],
      ),
      buttons: [
        DialogButton(
          child: Text("ENTENDI",
              style: ThemeModeApp.of(context).bodyMedium),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop();
            await Geolocator.openAppSettings();
          },
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              ThemeModeApp.of(context).secondary,
              ThemeModeApp.of(context).primary,
            ],
          ),
          radius: BorderRadius.circular(6.0),
        ),
      ],
    ).show();
  }

  alertSucesso(
    titulo,
    texto,
  ) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: true,
      isOverlayTapDismiss: false,
      backgroundColor: ThemeModeApp.of(context).primaryBackground,
      descStyle: const TextStyle(fontWeight: FontWeight.bold),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: ThemeModeApp.of(context).primaryBackground),
      ),
      titleStyle: FontsThemeModeApp(ThemeModeApp.of(context)).titleMedium,
      overlayColor: const Color(0x55000000),
    );
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.success,
      closeIcon: Icon(
        Icons.close,
        color: ThemeModeApp.of(context).primary,
      ),
      title: titulo,
      content: Column(
        children: [
          Text(texto,
              style: FontsThemeModeApp(ThemeModeApp.of(context)).bodyMedium),
        ],
      ),
      buttons: [
        DialogButton(
          child: Text("ENTENDI",
              style: FontsThemeModeApp(ThemeModeApp.of(context)).bodyMedium),
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => ViewRelatorio()));
          },
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              ThemeModeApp.of(context).success,
              ThemeModeApp.of(context).secondary,
            ],
          ),
          radius: BorderRadius.circular(6.0),
        ),
      ],
    ).show();
  }
}
