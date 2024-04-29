import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:ga_proj/app/services/home/home_widgets.dart';
import 'package:ga_proj/app/services/product/product_widgets.dart';
import 'package:ga_proj/app/services/product/store/product_store.dart';
import 'package:ga_proj/backend/db/api/get/get.supabase.service.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:ga_proj/models/product.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductStore productStore;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    productStore = Provider.of<ProductStore>(context, listen: false);
    initPage();
    super.didChangeDependencies();
  }

  bool init = false;

  initPage() async {
    if (!init) {
      final rep = await GetSupaBaseApi().findProductAll();
      productStore.clearProducts();
      if (rep != []) {
        for (var element in rep) {
          Product client = Product.fromJson(element);
          productStore.addProduct(client);
        }
      }
      // log("Clientes: ${serviceStore.listCompanies.length}");
      setState(() {
        init = true;
      });
    }
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ThemeModeApp.of(context).secondaryBackground,
      body: SafeArea(
        top: true,
        child: SliderDrawer(
          appBar: SliderAppBar(
              drawerIconColor: ThemeModeApp.of(context).secondaryText,
              appBarColor: ThemeModeApp.of(context).secondaryBackground,
              title: Text(" ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
          slider: HomeWidgets(context).drawerMenu(),
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
