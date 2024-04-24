import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:ga_proj/app/services/home/home_widgets.dart';
import 'package:ga_proj/app/services/perfil/perfil_widgets.dart';
import 'package:ga_proj/global/theme/theme_mode.dart'; 
import 'package:provider/provider.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
 

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() { 
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ThemeModeApp.of(context).secondaryBackground,
      body: SafeArea(
        top: true,
        child: SliderDrawer(
          appBar: const SliderAppBar(
              appBarColor: Colors.white,
              title: Text(" ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
          slider: HomeWidgets(context).drawerMenu(
   
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PerfilWidgets(context).widgetPrincipal(),
            ],
          ),
        ),
      ),
    );
  }
}
