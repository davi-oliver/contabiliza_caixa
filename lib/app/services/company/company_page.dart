import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:ga_proj/app/services/company/company_widgets.dart';
import 'package:ga_proj/app/services/home/home_widgets.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ThemeModeApp.of(context).secondaryBackground,
      body: SafeArea(
        top: true,
        child: SliderDrawer(
          appBar:   SliderAppBar(
              appBarColor: ThemeModeApp.of(context).secondaryBackground,
              drawerIconColor: ThemeModeApp.of(context).secondaryText,
              title: Text(" ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
          slider: HomeWidgets(context).drawerMenu(
   
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CompanyWidgets(context).widgetPrincipal(),
            ],
          ),
        ),
      ),
    );
  }
}