// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 
import 'package:ga_proj/app/services/home/store/home_store.dart'; 
import 'package:ga_proj/app/services/sales/store/store_sale.dart';
import 'package:ga_proj/app/store/serviceStore.dart';
import 'package:ga_proj/components/flutter_flow/flutter_flow_widgets.dart';
import 'package:ga_proj/global/globals_fonts.dart';
import 'package:ga_proj/global/globals_functions.dart';
import 'package:ga_proj/global/globals_routes.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:go_router/go_router.dart'; 
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeWidgets {
  BuildContext context;
  HomeWidgets(this.context);
  Widget drawerMenu() {
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    return Container(
      padding: const EdgeInsets.only(top: 20),
      color: ThemeModeApp.of(context).primaryBackground,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // logo
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "asset/images/logo.png",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    width: 200,
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              color:
                  ThemeModeApp.of(context).primaryBackground.withOpacity(0.4),
              indent: 32,
              endIndent: 32,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 10, vertical: 20),
                  child: Text(
                    "Ferramentas",
                    style: ThemeModeApp.of(context).labelMedium.copyWith(
                          fontFamily: 'Plus Jakarta Sans',
                          color: const Color.fromARGB(255, 155, 178, 207),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
            homeStore.selectedMenuItem == 1
                ? ItemCardMenuSelect(
                    context: context,
                    icon: Icons.home,
                    title: "Dashboard",
                    onTap: () {
                      homeStore.setSelectedMenuItem(1);
                      log("homeStore.selectedMenuItem ${homeStore.selectedMenuItem}");
                      context.pushNamed(homePage);
                    },
                  )
                : ItemCardMenu(
                    context: context,
                    icon: Icons.home,
                    title: "Dashboard",
                    onTap: () {
                      homeStore.setSelectedMenuItem(1);
                      log("homeStore.selectedMenuItem ${homeStore.selectedMenuItem}");
                      context.pushNamed(homePage);
                    },
                    index: 1),
            const SizedBox(height: 10),
            homeStore.selectedMenuItem == 2
                ? ItemCardMenuSelect(
                    context: context,
                    icon: FontAwesomeIcons.productHunt,
                    title: "Produtos",
                    onTap: () {
                      homeStore.setSelectedMenuItem(2);
                      log("homeStore.selectedMenuItem ${homeStore.selectedMenuItem}");
                      context.pushNamed(productPage);
                    },
                  )
                : ItemCardMenu(
                    context: context,
                    icon: FontAwesomeIcons.productHunt,
                    title: "Produtos",
                    onTap: () {
                      homeStore.setSelectedMenuItem(2);
                      log("homeStore.selectedMenuItem ${homeStore.selectedMenuItem}");
                      context.pushNamed(productPage);
                    },
                    index: 2),
            const SizedBox(height: 10),

            homeStore.selectedMenuItem == 3
                ? ItemCardMenuSelect(
                    context: context,
                    icon: Icons.person_pin_circle_rounded,
                    title: "Fornecedores",
                    onTap: () {
                      homeStore.setSelectedMenuItem(3);
                      log("homeStore.selectedMenuItem ${homeStore.selectedMenuItem}");
                      context.pushNamed(companyPage);
                    },
                  )
                : ItemCardMenu(
                    context: context,
                    icon: Icons.person_pin_circle_rounded,
                    title: "Fornecedores",
                    onTap: () {
                      homeStore.setSelectedMenuItem(3);
                      log("homeStore.selectedMenuItem ${homeStore.selectedMenuItem}");
                      context.pushNamed(companyPage);
                    },
                    index: 3),
            const SizedBox(height: 10),

            //
            homeStore.selectedMenuItem == 4
                ? ItemCardMenuSelect(
                    context: context,
                    icon: Icons.shopping_basket_rounded,
                    title: "Estoque",
                    onTap: () {
                      homeStore.setSelectedMenuItem(4);
                      log("homeStore.selectedMenuItem ${homeStore.selectedMenuItem}");
                      context.pushNamed(stockPage);
                    },
                  )
                : ItemCardMenu(
                    context: context,
                    icon: Icons.shopping_basket_rounded,
                    title: "Estoque",
                    onTap: () {
                      homeStore.setSelectedMenuItem(4);
                      log("homeStore.selectedMenuItem ${homeStore.selectedMenuItem}");
                      context.pushNamed(stockPage);
                    },
                    index: 3),
            const SizedBox(height: 10),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 10, vertical: 20),
                  child: Text(
                    "Configurações",
                    style: ThemeModeApp.of(context).labelMedium.copyWith(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 14.0,
                          color: const Color.fromARGB(255, 155, 178, 207),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
            homeStore.selectedMenuItem == 5
                ? ItemCardMenuSelect(
                    context: context,
                    icon: Icons.person_pin_rounded,
                    title: "Meu Perfil",
                    onTap: () {
                      homeStore.setSelectedMenuItem(5);
                      context.pushNamed(perfilPage);
                    },
                  )
                : ItemCardMenu(
                    context: context,
                    icon: Icons.person_pin_rounded,
                    title: "Meu Perfil",
                    onTap: () {
                      homeStore.setSelectedMenuItem(5);
                      context.pushNamed(perfilPage);
                    },
                    index: 5),
          ],
        ),
      ),
    );
  }

  Widget miniaturaFotoPerfil() {
    // final userInfos = Provider.of<UserInfos>(context, listen: false);

    return ClipOval(
      child: Observer(
        builder: (_) {
          return Material(
            color: Colors.transparent,
            child: Image.network(
              "https://ui-avatars.com/api/?name=a&background=0D8ABC&color=fff&size=128",
              fit: BoxFit.cover,
              width: 60,
              height: 60,
              filterQuality: FilterQuality.high,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                "asset/images/logo.png",
                width: 50,
                height: 50,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget cardMenuProfile(ThemeModeApp theme) {
    return Container(
      color: theme.primaryBackground.withOpacity(0.6),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: theme.primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          color: theme.primaryText.withOpacity(0.2),
                          blurRadius: 15.0,
                          spreadRadius: 0.2,
                          offset: const Offset(
                            2.0,
                            5.0,
                          ),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: theme.primaryBackground,
                              border:
                                  Border.all(color: theme.primary, width: 3),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Image.asset(
                              "asset/images/logo.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Column(
                            children: [
                              Text(
                                "Jhon Doe",
                                style: ThemeModeApp.of(context)
                                    .headlineSmall
                                    .copyWith(color: theme.primaryText),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: theme.primaryBackground,
                                  border: Border.all(
                                      color:
                                          theme.primaryText.withOpacity(0.1)),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  "PRO",
                                  style: ThemeModeApp.of(context)
                                      .bodyLarge
                                      .copyWith(color: theme.primary),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(perfilPage);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.person_pin,
                                          color: theme.primary),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Seu Perfil",
                                        style: ThemeModeApp.of(context)
                                            .headlineSmall
                                            .copyWith(color: theme.primaryText),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.pushNamed(configsPage);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                              Icons
                                                  .settings_applications_rounded,
                                              color: theme.primary),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Configurações",
                                            style: ThemeModeApp.of(context)
                                                .headlineSmall
                                                .copyWith(
                                                    color: theme.primaryText),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: theme.primaryText.withOpacity(0.1),
                        ),
                        GestureDetector(
                          onTap: () => context.pushReplacementNamed(loginPage),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20),
                            child: Row(
                              children: [
                                Icon(Icons.logout, color: theme.tertiary),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Sair",
                                  style: ThemeModeApp.of(context)
                                      .headlineSmall
                                      .copyWith(color: theme.tertiary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardNotificationList(theme) {
    return Container(
      color: theme.primaryBackground.withOpacity(0.6),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: theme.primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          color: theme.primaryText.withOpacity(0.2),
                          blurRadius: 15.0,
                          spreadRadius: 0.2,
                          offset: const Offset(
                            2.0,
                            5.0,
                          ),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, right: 20, left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Notificações",
                                style: ThemeModeApp.of(context)
                                    .bodyLarge
                                    .copyWith(
                                        color: theme.primary,
                                        fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("Limpar Tudo",
                                  style: ThemeModeApp.of(context)
                                      .bodyMedium
                                      .copyWith(
                                          color: theme.primary,
                                          fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myClientes() {
    final serviceStore = Provider.of<ServiceStore>(context, listen: false);
    final theme = ThemeModeApp.of(context);
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Meus Fornecedores',
                style: FontsThemeModeApp(theme).headlineMedium,
              ),
              const SizedBox(width: 10),
              Icon(Icons.info_outline,
                  color: theme.primaryText.withOpacity(0.4)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Veja todos os seus fornecedores cadastrados',
                style: FontsThemeModeApp(theme)
                    .headlineSmall
                    .copyWith(color: ThemeModeApp.of(context).secondaryText),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: ThemeModeApp.of(context).primaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              )
            ],
          ),
          child: serviceStore.listCompanies.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Text(
                    "Você ainda não possui clientes cadastrados",
                    style: FontsThemeModeApp(theme).bodyMedium,
                  ),
                )
              : ListView.builder(
                  itemCount: serviceStore.listCompanies.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, int index) {
                    var item = serviceStore.listCompanies[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 20.0, 0.0, 2.0),
                          child: Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 2.0, 12.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 12.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: Image.network(
                                            'https://images.unsplash.com/photo-1611691543545-f19c70f74a29?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQ0fHRvd0paRnNrcEdnfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            item.company?.name ?? "",
                                            style: FontsThemeModeApp(theme)
                                                .titleMedium,
                                          ),
                                          Text(
                                            ' ${item.address?.street}, ${item.address?.number} - ${item.address?.neighborhood} - ${item.address?.city} ',
                                            style: FontsThemeModeApp(theme)
                                                .bodyMedium,
                                                overflow: TextOverflow.fade,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                   
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
        ),
      ],
    );
  }

  Widget cardSale() {
    final theme = ThemeModeApp.of(context);
    final store = Provider.of<SaleStore>(context, listen: false);
    return Observer(builder: (_) {
      return Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                  "https://images.pexels.com/photos/4386178/pexels-photo-4386178.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  width: double.infinity,
                  height: 185,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            decoration: BoxDecoration(
              color: ThemeModeApp.of(context).primary,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Compras de Abril',
                        style: FontsThemeModeApp(theme).headlineMedium,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'R\$ ${store.listSaleDay.isEmpty ? "0,00" : store.listSaleDay.map((e) => e.total).reduce((value, element) => value + element).toStringAsFixed(2)}',
                        style: FontsThemeModeApp(theme).headlineSmall,
                      ),
                    ],
                  ),
                  Observer(builder: (_) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.all(5.0),
                          child: LinearPercentIndicator(
                            percent: 0.4,
                            lineHeight: 20.0,
                            barRadius: const Radius.circular(19.0),
                            animation: true,
                            progressColor: ThemeModeApp.of(context).secondary,
                            backgroundColor:
                                ThemeModeApp.of(context).primaryBackground,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: ThemeModeApp.of(context).accent4,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                   context.pushNamed(formularioCadstroCompra);
                                  },
                                  child: Text('Cadastrar Compra',
                                      style: FontsThemeModeApp(theme)
                                          .bodyLarge
                                          .copyWith(
                                            color: ThemeModeApp.of(context)
                                                .primaryText,
                                          )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget dashbordRelatorio() {
    return Column(
      children: [
        Container(
          color: ThemeModeApp.of(context).secondaryBackground,
          margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Relatórios',
                        style: ThemeModeApp.of(context).headlineMedium.copyWith(
                              color: ThemeModeApp.of(context).primaryText,
                            ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.info_outline,
                        color: ThemeModeApp.of(context)
                            .primaryText
                            .withOpacity(0.2),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Explore & Gerencie relatórios',
                        style: ThemeModeApp.of(context).bodyLarge.copyWith(
                              color: ThemeModeApp.of(context).primaryText,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              FFButtonWidget(
                  text: "Ver Todos",
                  onPressed: () {},
                  options: FFButtonOptions(
                    width: 100,
                    height: 40,
                    color: ThemeModeApp.of(context).secondary,
                    textStyle: ThemeModeApp.of(context).bodyLarge.copyWith(
                          color: ThemeModeApp.of(context).primaryBackground,
                        ),
                  ))
            ],
          ),
        ),
        if (responsiveVisibility(
                context: context,
                phone: false,
                desktop: true,
                tablet: true,
                tabletLandscape: true) &&
            kIsWeb)
          Column(
            children: [
              cardTransacoes(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                child: cardBuget(),
              )
            ],
          ),
        if (responsiveVisibility(
                context: context,
                phone: false,
                desktop: true,
                tablet: true,
                tabletLandscape: true) &&
            !kIsWeb)
          Row(
            children: [cardTransacoes(), cardBuget()],
          ),
        if (responsiveVisibility(
          context: context,
          phone: true,
          desktop: false,
          tablet: false,
          tabletLandscape: false,
        ))
          Column(
            children: [
              cardTransacoes(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                child: cardBuget(),
              )
            ],
          ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Padding cardTransacoes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: ThemeModeApp.of(context).primaryBackground,
              boxShadow: [
                BoxShadow(
                  color: ThemeModeApp.of(context).primaryText.withOpacity(0.2),
                  blurRadius: 15.0,
                  spreadRadius: 0.2,
                  offset: const Offset(
                    2.0,
                    5.0,
                  ),
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "237",
                          style: ThemeModeApp.of(context).displaySmall,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: ThemeModeApp.of(context)
                                .success
                                .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text("+ 12%",
                              style:
                                  ThemeModeApp.of(context).bodyLarge.copyWith(
                                        color: ThemeModeApp.of(context).success,
                                      )),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Transações este mês",
                          style:
                              ThemeModeApp.of(context).headlineSmall.copyWith(
                                    color: ThemeModeApp.of(context)
                                        .primaryText
                                        .withOpacity(0.8),
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    cardListProduct(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzOKac3hyFW_bPuFA0PlGnyo58G-G5rbqROQDnrT1ocg&s",
                        "Fugini",
                        "489"),
                    Divider(
                      color:
                          ThemeModeApp.of(context).primaryText.withOpacity(0.1),
                    ),
                    cardListProduct(
                        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fpt%2Fsearch%2Fcoca-cola&psig=AOvVaw1CbshH4SfrTFvKYae9BY3P&ust=1714507206647000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCKCUx5ub6IUDFQAAAAAdAAAAABAE",
                        "Coca-Cola",
                        "1.200"),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardBuget() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ThemeModeApp.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                color: ThemeModeApp.of(context).primaryText.withOpacity(0.2),
                blurRadius: 15.0,
                spreadRadius: 0.2,
                offset: const Offset(
                  2.0,
                  5.0,
                ),
              ),
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "Saldo na Conta",
                    style: ThemeModeApp.of(context).displaySmall,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Saldo de Abril",
                    style: ThemeModeApp.of(context).headlineSmall.copyWith(
                          color: ThemeModeApp.of(context)
                              .primaryText
                              .withOpacity(0.8),
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 25),
                decoration: BoxDecoration(
                  color: ThemeModeApp.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: ThemeModeApp.of(context)
                          .primaryText
                          .withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    Text(
                      "R\$ 1.200,00",
                      style: ThemeModeApp.of(context).headlineMedium.copyWith(
                            color: ThemeModeApp.of(context).secondary,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Saldo disponível",
                      style: ThemeModeApp.of(context).bodyMedium.copyWith(
                            color: ThemeModeApp.of(context).secondaryText,
                          ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }

  Widget cardListProduct(urlImage, product, valor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(
            urlImage,
            width: 40,
            height: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Text("$product",
              style: ThemeModeApp.of(context).bodyLarge.copyWith(
                    color: ThemeModeApp.of(context).primaryText,
                  )),
          const SizedBox(
            width: 20,
          ),
          Icon(Icons.account_balance_wallet_outlined,
              color: ThemeModeApp.of(context).primary),
          const SizedBox(
            width: 10,
          ),
          AutoSizeText(
            "R\$ $valor",
            style: ThemeModeApp.of(context).bodyLarge.copyWith(
                  color: ThemeModeApp.of(context).primaryText,
                ),
          ),
        ],
      ),
    );
  }
}

class ItemCardMenu extends StatelessWidget {
  ItemCardMenu({
    super.key,
    required this.context,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.index,
  });

  String title;
  IconData icon;
  void Function()? onTap;
  int index;

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: double.infinity,
          height: 55.0,
          decoration: BoxDecoration(
            color: ThemeModeApp.of(context).primaryBackground.withOpacity(0.6),
            borderRadius: BorderRadius.circular(2.0),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 6.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  icon,
                  color: ThemeModeApp.of(context).primary,
                  size: 24.0,
                ),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    title,
                    style: ThemeModeApp.of(context).bodyMedium.copyWith(
                          fontFamily: 'Plus Jakarta Sans',
                          color: ThemeModeApp.of(context).primaryText,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemCardMenuSelect extends StatelessWidget {
  ItemCardMenuSelect({
    super.key,
    required this.context,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  String title;
  IconData icon;
  void Function()? onTap;

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: double.infinity,
          height: 54.0,
          decoration: BoxDecoration(
            color: ThemeModeApp.of(context).primary,
            borderRadius: BorderRadius.circular(12.0),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 6.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  icon,
                  color: ThemeModeApp.of(context).primaryBackground,
                  size: 24.0,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    title,
                    style: ThemeModeApp.of(context).bodyMedium.copyWith(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
