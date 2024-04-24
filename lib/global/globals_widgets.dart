import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';

class GlobalsWidgets {
  BuildContext context;
  GlobalsWidgets(this.context);
    BoxShadow sombreadoBoxShadow() {
     
    return BoxShadow(
      color: ThemeModeApp.of(context).primaryText.withOpacity(0.2),
      blurRadius: 15.0, // has the effect of softening the shadow
      spreadRadius: 0.2, // has the effect of extending the shadow
      offset: const Offset(
        2.0, // horizontal, move right 10
        5.0, // vertical, move down 10
      ),
    );
  }
    Widget loadingPage(double sizeH, double sizeW) { 
    return Observer(builder: (_) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        color: ThemeModeApp.of(context).secondaryBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedTextKit(
              isRepeatingAnimation: true,
              repeatForever: true,

              animatedTexts: [
              TyperAnimatedText(
                "Sincronizando seu Dispositivo",
                speed: const Duration(milliseconds: 100),
                textAlign: TextAlign.center,
                textStyle: ThemeModeApp.of(context).bodyLarge,
              ),
               TyperAnimatedText(
                "Aguarde...",
                speed: const Duration(milliseconds: 100),
                textAlign: TextAlign.center,
                textStyle: ThemeModeApp.of(context).bodyLarge,
              ),

            ]),
            
          ],
        ),
      );
    });
  }
}