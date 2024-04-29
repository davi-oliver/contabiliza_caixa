import 'package:flutter/material.dart';
import 'package:ga_proj/components/flutter_flow/flutter_flow_widgets.dart';
import 'package:ga_proj/global/globals_routes.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:go_router/go_router.dart';

class PerfilWidgets {
  BuildContext context;
  PerfilWidgets(this.context);

  Widget perfilFotoName() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ThemeModeApp.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 1.0,
                color: ThemeModeApp.of(context).primaryBackground,
                offset: const Offset(0.0, 0.0),
              )
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: ThemeModeApp.of(context).alternate,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        2.0, 2.0, 2.0, 2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'asset/images/logo.png',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Gerente de Contas",
                            style: ThemeModeApp.of(context).headlineSmall,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          "Nome do Usuário",
                          style: ThemeModeApp.of(context).bodySmall.copyWith(
                                color: ThemeModeApp.of(context).primary,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget linhaAlterarTema() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (Theme.of(context).brightness == Brightness.light)
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {},
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: ThemeModeApp.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 12.0, 24.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Escolha o tema",
                        style: ThemeModeApp.of(context).headlineSmall,
                      ),
                      Container(
                        width: 80.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: ThemeModeApp.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Stack(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.95, 0.00),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Icon(
                                  Icons.nights_stay,
                                  color: ThemeModeApp.of(context).secondaryText,
                                  size: 20.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment:
                                  const AlignmentDirectional(-0.85, 0.00),
                              child: Container(
                                width: 36.0,
                                height: 36.0,
                                decoration: BoxDecoration(
                                  color: ThemeModeApp.of(context)
                                      .secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x430B0D0F),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (Theme.of(context).brightness == Brightness.dark)
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {},
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: ThemeModeApp.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 12.0, 24.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Escolha o tema",
                        style: ThemeModeApp.of(context).headlineSmall,
                      ),
                      Container(
                        width: 80.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: ThemeModeApp.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Stack(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          children: [
                            Align(
                              alignment:
                                  const AlignmentDirectional(-0.90, 0.00),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 2.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.wb_sunny_rounded,
                                  color: ThemeModeApp.of(context).secondaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.90, 0.00),
                              child: Container(
                                width: 36.0,
                                height: 36.0,
                                decoration: BoxDecoration(
                                  color: ThemeModeApp.of(context)
                                      .secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x430B0D0F),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget widgetPrincipal() {
    return Expanded(
      child: Align(
        alignment: const AlignmentDirectional(0.00, -1.00),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 1170.0,
          ),
          decoration: BoxDecoration(
            color: ThemeModeApp.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 20.0,
                color: ThemeModeApp.of(context).primaryText.withOpacity(0.1),
                offset: Offset(0.0, 2.0),
              )
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                perfilFotoName(),
                // linhaAlterarTema(),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 12.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Configure sua conta",
                            style: ThemeModeApp.of(context).labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                botoesConfiguracaoEConta(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget botoesConfiguracaoEConta() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: ThemeModeApp.of(context).primaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    color:
                        ThemeModeApp.of(context).primaryText.withOpacity(0.1),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "Alterar Cadastro",
                        style: ThemeModeApp.of(context).labelMedium,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.90, 0.00),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: ThemeModeApp.of(context).secondaryText,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(configsPage);
          },
          child: Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: ThemeModeApp.of(context).primaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    color:
                        ThemeModeApp.of(context).primaryText.withOpacity(0.1),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "Configurações e Privacidade",
                        style: ThemeModeApp.of(context).labelMedium,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.90, 0.00),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: ThemeModeApp.of(context).secondaryText,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  context.pushReplacementNamed(loginPage);
                },
                text: "Sair",
                options: FFButtonOptions(
                  width: 90.0,
                  height: 40.0,
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: ThemeModeApp.of(context).primaryBackground,
                  textStyle: ThemeModeApp.of(context).bodySmall.copyWith(
                        fontFamily: 'Lexend Deca',
                        color: ThemeModeApp.of(context).primaryText,
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 1.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
