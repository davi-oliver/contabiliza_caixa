import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:ga_proj/app/services/home/home_widgets.dart';
import 'package:ga_proj/app/services/product/product_widgets.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
 final scaffoldKey = GlobalKey<ScaffoldState>();
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
              ProductsWidgets(context).widgetPrincipal(),
            ],
          ),
        ),
      ),
    );
  }
}