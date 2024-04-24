import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ga_proj/app/fonts/typography.dart';
import 'package:ga_proj/app/services/home/store/home_store.dart';
import 'package:ga_proj/global/globals_routes.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeWidgets {
  BuildContext context;
  HomeWidgets(this.context);
  Widget drawerMenu() {
    final homeStore = Provider.of<HomeStore>(context, listen: false);
    return Container(
      padding: const EdgeInsets.only(top: 20),
      color: ThemeModeApp.of(context).primaryText,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const PerfilPage(),
              //   ),
              // );
              context.pushNamed(perfilPage);
            },
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ThemeModeApp.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: miniaturaFotoPerfil(),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          /*userInfos.userName == null
                                            ? "Carregando..."
                                            : "${userInfos.userName}",*/
                          // '${userInfos.userModel?.person?.name}',
                          "Aguarde...",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: ThemeModeApp.of(context).bodyLarge.copyWith(
                                color:
                                    ThemeModeApp.of(context).primaryBackground,
                              ),
                        ),
                        Text(
                          /*userInfos.userEmail == null
                                            ? "Carregando..."
                                            : "${userInfos.userEmail}",*/
                          // '${userInfos.userModel?.secUser?.email}',
                          "Aguarde...",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: ThemeModeApp.of(context).bodyLarge.copyWith(
                                color:
                                    ThemeModeApp.of(context).primaryBackground,
                              ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 20,
            thickness: 0.5,
            color: ThemeModeApp.of(context).primaryBackground.withOpacity(0.4),
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
                  style: ThemeModeApp.of(context).labelMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color.fromARGB(255, 155, 178, 207),
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
          SizedBox(height: 10),
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
          SizedBox(height: 10),

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
          SizedBox(height: 10),

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
          SizedBox(height: 10),

          Row(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 10, vertical: 20),
                child: Text(
                  "Configurações",
                  style: ThemeModeApp.of(context).labelMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 14.0,
                        color: Color.fromARGB(255, 155, 178, 207),
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
    );
  }

  Widget miniaturaFotoPerfil() {
    // final userInfos = Provider.of<UserInfos>(context, listen: false);
    int alturaLarguraImagem = 160;
    return ClipOval(
      child: Observer(
        builder: (_) {
          return Material(
            color: Colors.transparent,
            child: Image.network(
              "https://ui-avatars.com/api/?name=a&background=0D8ABC&color=fff&size=128",
              fit: BoxFit.cover,
              width: double.parse("$alturaLarguraImagem"),
              height: double.parse("$alturaLarguraImagem"),
              filterQuality: FilterQuality.high,
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset("asset/images/logo.png"),
            ),
          );
        },
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
            color:
                ThemeModeApp.of(context).primaryText.withOpacity(0.6),
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
                  color: ThemeModeApp.of(context).primary,
                  size: 24.0,
                ),
                SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    title,
                    style: ThemeModeApp.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: ThemeModeApp.of(context).primaryBtnText,
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
                Expanded(
                  child: Text(
                    title,
                    style: ThemeModeApp.of(context).bodyMedium.override(
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
