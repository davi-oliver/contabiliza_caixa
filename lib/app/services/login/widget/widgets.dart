// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ga_proj/app/fonts/typography.dart';
import 'package:ga_proj/app/services/login/store/login_store.dart';
import 'package:ga_proj/components/flutter_flow/flutter_flow_widgets.dart';
import 'package:ga_proj/global/globals_alert.dart';
import 'package:ga_proj/global/globals_animations.dart';
import 'package:ga_proj/global/globals_functions.dart';
import 'package:ga_proj/global/globals_routes.dart';
import 'package:ga_proj/global/globals_widgets.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginWidgets {
  BuildContext context;
  LoginWidgets(this.context);

  Widget widgetPrincipal() {
    return SafeArea(
      top: true,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _painelLogin(),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
          ))
            _painelDireita(),
        ],
      ),
    );
  }

  Widget widgetRecover() {
    return SafeArea(
      top: true,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _painelRecover(),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
          ))
            _painelDireita(),
        ],
      ),
    );
  }

  Widget widgetCreateAccount() {
    return SafeArea(
      top: true,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _painelCreateAccount(),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
          ))
            _painelDireita(),
        ],
      ),
    );
  }

  Widget _painelDireita() {
    return Expanded(
      flex: 8,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Container(
          width: 100.0,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(88, 13, 219, 1),
                Color.fromRGBO(248, 170, 179, 1)
              ],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(1.0, -1.0),
              end: AlignmentDirectional(-1.0, 1.0),
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        maxWidth: 400.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x2E000000),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: const Color(0xFFF1F4F8),
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            4.0, 4.0, 4.0, 4.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 60,
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "asset/images/logo_right.png",
                                    //width: MediaQuery.of(context).size.width * .45,
                                    height: MediaQuery.of(context).size.height *
                                        .20,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _opcaoEntrarEmail() {
    final loginStoreF = Provider.of<LoginStore>(context, listen: false);
    final loginStoreT = Provider.of<LoginStore>(context, listen: true);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              color: ThemeModeApp.of(context).secondaryBackground,
              borderRadius:
                  BorderRadius.all(Radius.circular(GlobalsSizes().borderSize)),
              boxShadow: [
                GlobalsWidgets(context).sombreadoBoxShadow(),
              ],
            ),
            child: TextFormField(
              style: TextStyle(
                color: ThemeModeApp.of(context).primaryText,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: ThemeModeApp.of(context).secondaryText,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
              onChanged: (value) {
                //print(loginFunctions.controllerEmail.text);
              },
              controller: loginStoreF.cpfController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black.withOpacity(0.3),
            ),
          ),
        ),
        Observer(
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                  color: ThemeModeApp.of(context).secondaryBackground,
                  borderRadius: BorderRadius.all(
                      Radius.circular(GlobalsSizes().borderSize)),
                  boxShadow: [
                    GlobalsWidgets(context).sombreadoBoxShadow(),
                  ],
                ),
                child: TextFormField(
                  obscureText: loginStoreF.isPasswordVisible,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Senha',
                    hintStyle: TextStyle(
                      color: ThemeModeApp.of(context).secondaryText,
                    ),
                    suffixIcon: IconButton(
                      onPressed: loginStoreF.setVisibityPassword,
                      icon: Icon(
                        loginStoreT.isPasswordVisible
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        size: 20,
                        color: ThemeModeApp.of(context).primary,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    //print(loginFunctions.controllerSenha.text);
                  },
                  controller: loginStoreF.passwordController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black.withOpacity(0.3),
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      10.0, 1.0, 0.0, 12.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(recoverPage);
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Esqueci minha senha!',
                            style: ThemeModeApp.of(context)
                                .bodyLarge
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: ' Recuperar já',
                            style: ThemeModeApp.of(context).bodyLarge.copyWith(
                                  color: ThemeModeApp.of(context).primary,
                                ),
                          )
                        ],
                        style: ThemeModeApp.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: const Color(0xFF101213),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      textScaler: TextScaler.linear(
                          MediaQuery.of(context).textScaleFactor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        armazenaCredenciais(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      10.0, 1.0, 0.0, 12.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(createAccountPage);
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Não tem conta?',
                            style: ThemeModeApp.of(context)
                                .bodyLarge
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: ' Criar',
                            style: ThemeModeApp.of(context).bodyLarge.copyWith(
                                  color: ThemeModeApp.of(context).primary,
                                ),
                          )
                        ],
                        style: ThemeModeApp.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: const Color(0xFF101213),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      textScaler: TextScaler.linear(
                          MediaQuery.of(context).textScaleFactor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pushReplacementNamed(homePage);
                },
                text: 'Entrar',
                icon: const Icon(Icons.login),
                options: FFButtonOptions(
                  width: 120,
                  height: 44.0,
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: ThemeModeApp.of(context).primary,
                  textStyle: ThemeModeApp.of(context).titleSmall.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _formCreateAccount() {
    final loginStoreF = Provider.of<LoginStore>(context, listen: false);
    final loginStoreT = Provider.of<LoginStore>(context, listen: true);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                color: ThemeModeApp.of(context).secondaryBackground,
                borderRadius: BorderRadius.all(
                    Radius.circular(GlobalsSizes().borderSize)),
                boxShadow: [
                  GlobalsWidgets(context).sombreadoBoxShadow(),
                ],
              ),
              child: TextFormField(
                style: TextStyle(
                  color: ThemeModeApp.of(context).primaryText,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nome',
                  hintStyle: TextStyle(
                    color: ThemeModeApp.of(context).secondaryText,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onChanged: (value) {
                  //print(loginFunctions.controllerEmail.text);
                },
                controller: loginStoreF.nameController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                color: ThemeModeApp.of(context).secondaryBackground,
                borderRadius: BorderRadius.all(
                    Radius.circular(GlobalsSizes().borderSize)),
                boxShadow: [
                  GlobalsWidgets(context).sombreadoBoxShadow(),
                ],
              ),
              child: TextFormField(
                style: TextStyle(
                  color: ThemeModeApp.of(context).primaryText,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: ThemeModeApp.of(context).secondaryText,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onChanged: (value) {
                  //print(loginFunctions.controllerEmail.text);
                },
                controller: loginStoreF.emailController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Observer(
            builder: (_) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: BoxDecoration(
                    color: ThemeModeApp.of(context).secondaryBackground,
                    borderRadius: BorderRadius.all(
                        Radius.circular(GlobalsSizes().borderSize)),
                    boxShadow: [
                      GlobalsWidgets(context).sombreadoBoxShadow(),
                    ],
                  ),
                  child: TextFormField(
                    obscureText: loginStoreF.isPasswordVisible,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Senha',
                      hintStyle: TextStyle(
                        color: ThemeModeApp.of(context).secondaryText,
                      ),
                      suffixIcon: IconButton(
                        onPressed: loginStoreF.setVisibityPassword,
                        icon: Icon(
                          loginStoreT.isPasswordVisible
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          size: 20,
                          color: ThemeModeApp.of(context).primary,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      //print(loginFunctions.controllerSenha.text);
                    },
                    controller: loginStoreF.passwordController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black.withOpacity(0.3),
                  ),
                ),
              );
            },
          ),
          Observer(
            builder: (_) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: BoxDecoration(
                    color: ThemeModeApp.of(context).secondaryBackground,
                    borderRadius: BorderRadius.all(
                        Radius.circular(GlobalsSizes().borderSize)),
                    boxShadow: [
                      GlobalsWidgets(context).sombreadoBoxShadow(),
                    ],
                  ),
                  child: TextFormField(
                    obscureText: loginStoreF.isPasswordVisible,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirmar Senha',
                      hintStyle: TextStyle(
                        color: ThemeModeApp.of(context).secondaryText,
                      ),
                      suffixIcon: IconButton(
                        onPressed: loginStoreF.setVisibityPassword,
                        icon: Icon(
                          loginStoreT.isPasswordVisible
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          size: 20,
                          color: ThemeModeApp.of(context).primary,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      //print(loginFunctions.controllerSenha.text);
                    },
                    controller: loginStoreF.passwordConfirmController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black.withOpacity(0.3),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: ThemeModeApp.of(context).primary,
                ),
                Text("Endereço", style: ThemeModeApp.of(context).headlineSmall),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                color: ThemeModeApp.of(context).secondaryBackground,
                borderRadius: BorderRadius.all(
                    Radius.circular(GlobalsSizes().borderSize)),
                boxShadow: [
                  GlobalsWidgets(context).sombreadoBoxShadow(),
                ],
              ),
              child: TextFormField(
                style: TextStyle(
                  color: ThemeModeApp.of(context).primaryText,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'CEP',
                  hintStyle: TextStyle(
                    color: ThemeModeApp.of(context).secondaryText,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onChanged: (value) {
                  //print(loginFunctions.controllerEmail.text);
                },
                controller: loginStoreF.cepController,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    decoration: BoxDecoration(
                      color: ThemeModeApp.of(context).secondaryBackground,
                      borderRadius: BorderRadius.all(
                          Radius.circular(GlobalsSizes().borderSize)),
                      boxShadow: [
                        GlobalsWidgets(context).sombreadoBoxShadow(),
                      ],
                    ),
                    child: TextFormField(
                      style: TextStyle(
                        color: ThemeModeApp.of(context).primaryText,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Logradouro',
                        hintStyle: TextStyle(
                          color: ThemeModeApp.of(context).secondaryText,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        //print(loginFunctions.controllerEmail.text);
                      },
                      controller: loginStoreF.addressController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    decoration: BoxDecoration(
                      color: ThemeModeApp.of(context).secondaryBackground,
                      borderRadius: BorderRadius.all(
                          Radius.circular(GlobalsSizes().borderSize)),
                      boxShadow: [
                        GlobalsWidgets(context).sombreadoBoxShadow(),
                      ],
                    ),
                    child: TextFormField(
                      style: TextStyle(
                        color: ThemeModeApp.of(context).primaryText,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Número',
                        hintStyle: TextStyle(
                          color: ThemeModeApp.of(context).secondaryText,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        //print(loginFunctions.controllerEmail.text);
                      },
                      controller: loginStoreF.numberController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                color: ThemeModeApp.of(context).secondaryBackground,
                borderRadius: BorderRadius.all(
                    Radius.circular(GlobalsSizes().borderSize)),
                boxShadow: [
                  GlobalsWidgets(context).sombreadoBoxShadow(),
                ],
              ),
              child: TextFormField(
                style: TextStyle(
                  color: ThemeModeApp.of(context).primaryText,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Bairro',
                  hintStyle: TextStyle(
                    color: ThemeModeApp.of(context).secondaryText,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onChanged: (value) {
                  //print(loginFunctions.controllerEmail.text);
                },
                controller: loginStoreF.neighborhoodController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                color: ThemeModeApp.of(context).secondaryBackground,
                borderRadius: BorderRadius.all(
                    Radius.circular(GlobalsSizes().borderSize)),
                boxShadow: [
                  GlobalsWidgets(context).sombreadoBoxShadow(),
                ],
              ),
              child: TextFormField(
                style: TextStyle(
                  color: ThemeModeApp.of(context).primaryText,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Cidade',
                  hintStyle: TextStyle(
                    color: ThemeModeApp.of(context).secondaryText,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onChanged: (value) {
                  //print(loginFunctions.controllerEmail.text);
                },
                controller: loginStoreF.cityController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          // já tem conta?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        10.0, 1.0, 0.0, 12.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(loginPage);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Já tem conta?',
                              style: ThemeModeApp.of(context)
                                  .bodyLarge
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: ' Entrar',
                              style:
                                  ThemeModeApp.of(context).bodyLarge.copyWith(
                                        color: ThemeModeApp.of(context).primary,
                                      ),
                            )
                          ],
                          style: ThemeModeApp.of(context).bodyMedium.override(
                                fontFamily: 'Plus Jakarta Sans',
                                color: const Color(0xFF101213),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        textScaler: TextScaler.linear(
                            MediaQuery.of(context).textScaleFactor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushReplacementNamed(homePage);
                  },
                  text: 'Entrar',
                  icon: const Icon(Icons.login),
                  options: FFButtonOptions(
                    width: 120,
                    height: 44.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    color: ThemeModeApp.of(context).primary,
                    textStyle: ThemeModeApp.of(context).titleSmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget armazenaCredenciais() {
    final loginStore = Provider.of<LoginStore>(context, listen: false);
    final loginStoreT = Provider.of<LoginStore>(context, listen: true);
    return Observer(
      builder: (_) {
        return SwitchListTile(
          activeColor: ThemeModeApp.of(context).primary,
          trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
          title: Text("Habilitar acesso com digital",
              style: ThemeModeApp.of(context).bodyLarge.copyWith(
                  color: ThemeModeApp.of(context).primary,
                  fontWeight: FontWeight.w500)),
          subtitle: Text(
            "Selecione para habilitar o acesso com digital",
            style: ThemeModeApp.of(context).bodyMedium.copyWith(
                color: ThemeModeApp.of(context).secondaryText,
                fontWeight: FontWeight.w500),
            //
          ),
          value: loginStoreT.storeIsPasswordVisible,
          onChanged: (bool newValue) async {
            if (loginStoreT.cpfController.text.isEmpty) {
              await GlobalsAlert(context).alertWarning(
                title: "Atenção",
                text: "Informe o email para habilitar o acesso com digital",
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              );
              loginStore.setStoreIsPasswordVisible(false);
              return;
            } else if (loginStoreT.passwordController.text.isEmpty) {
              await GlobalsAlert(context).alertWarning(
                title: "Atenção",
                text: "Informe a senha para habilitar o acesso com digital",
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              );
              loginStore.setStoreIsPasswordVisible(false);
              return;
            } else {
              loginStore.setStoreIsPasswordVisible(newValue);
              if (newValue) {
                // await loginFunction.escreveLogin(loginStoreT);
              } else {
                // await loginFunction.deletaLogin();
              }
            }
          },
        );
      },
    );
  }

  Widget _painelLogin() {
    return Expanded(
      flex: 6,
      child: Container(
        width: 100.0,
        height: double.infinity,
        decoration: BoxDecoration(
          color: ThemeModeApp.of(context).secondaryBackground,
        ),
        alignment: const AlignmentDirectional(0.00, -1.00),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 140.0,
                  /*decoration: BoxDecoration(
                    color: ThemeModeApp.of(context).primaryBackground,
                 
                  ),*/
                  alignment: const AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Image.asset(
                        'asset/images/logo.png',
                        fit: BoxFit.cover,
                        width: 300,
                        height: 700,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 530.0,
                ),
                decoration: BoxDecoration(
                  color: ThemeModeApp.of(context).secondaryBackground,
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        24.0, 24.0, 24.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 12.0, 0.0, 24.0),
                          child: Text(
                            'Vamos começar pelo formulário abaixo',
                            textAlign: TextAlign.center,
                            style:
                                ThemeModeApp.of(context).labelMedium.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: const Color(0xFF57636C),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),

                        _opcaoEntrarEmail(),
                        // You will have to add an action on this rich text to go to your login page.
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _painelCreateAccount() {
    return Expanded(
      flex: 6,
      child: Container(
        width: 100.0,
        height: double.infinity,
        decoration: BoxDecoration(
          color: ThemeModeApp.of(context).secondaryBackground,
        ),
        alignment: const AlignmentDirectional(0.00, -1.00),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: context.pop,
                      icon: Icon(Icons.arrow_back_ios_new)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 140.0,
                  /*decoration: BoxDecoration(
                    color: ThemeModeApp.of(context).primaryBackground,
                 
                  ),*/
                  alignment: const AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Image.asset(
                        'asset/images/logo.png',
                        fit: BoxFit.cover,
                        width: 300,
                        height: 700,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 530.0,
                ),
                decoration: BoxDecoration(
                  color: ThemeModeApp.of(context).secondaryBackground,
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        24.0, 24.0, 24.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 12.0, 0.0, 24.0),
                          child: Text(
                            'Vamos começar pelo formulário abaixo',
                            textAlign: TextAlign.center,
                            style:
                                ThemeModeApp.of(context).labelMedium.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: const Color(0xFF57636C),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),

                        _formCreateAccount(),
                        // You will have to add an action on this rich text to go to your login page.
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _painelRecover() {
    return Expanded(
      flex: 6,
      child: Container(
        width: 100.0,
        height: double.infinity,
        decoration: BoxDecoration(
          color: ThemeModeApp.of(context).secondaryBackground,
        ),
        alignment: const AlignmentDirectional(0.00, -1.00),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: context.pop,
                      icon: Icon(Icons.arrow_back_ios_new)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 140.0,
                  /*decoration: BoxDecoration(
                    color: ThemeModeApp.of(context).primaryBackground,
                 
                  ),*/
                  alignment: const AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Image.asset(
                        'asset/images/logo.png',
                        fit: BoxFit.cover,
                        width: 300,
                        height: 700,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 530.0,
                ),
                decoration: BoxDecoration(
                  color: ThemeModeApp.of(context).secondaryBackground,
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        24.0, 24.0, 24.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 12.0, 0.0, 24.0),
                          child: Text(
                            'Vamos começar pelo formulário abaixo',
                            textAlign: TextAlign.center,
                            style:
                                ThemeModeApp.of(context).labelMedium.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: const Color(0xFF57636C),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),

                        _opcaoRecuperarSenha(),
                        // You will have to add an action on this rich text to go to your login page.
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _opcaoRecuperarSenha() {
    // final globalsStore = Provider.of<GlobalsStore>(context, listen: false);

    final loginStore = Provider.of<LoginStore>(context, listen: false);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              color: ThemeModeApp.of(context).secondaryBackground,
              borderRadius:
                  BorderRadius.all(Radius.circular(GlobalsSizes().borderSize)),
              boxShadow: [
                GlobalsWidgets(context).sombreadoBoxShadow(),
              ],
            ),
            child: TextFormField(
              style: TextStyle(
                color: ThemeModeApp.of(context).primaryText,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: ThemeModeApp.of(context).secondaryText,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Campo obrigatório';
                }
                return null;
              },
              onChanged: (value) {
                //print(loginFunctions.controllerEmail.text);
              },
              controller: loginStore.emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black.withOpacity(0.3),
            ),
          ),
        ),

        // armazenaCredenciais(),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FFButtonWidget(
                onPressed: () async {
                  // globalsStore.setLoading(true);

                  await Future.delayed(const Duration(seconds: 2));
                  if (!await GlobalsFunctions(context).verificaInternet()) {
                    await GlobalsAlert(context).alertSucesso(
                      "Sucesso!",
                      "Senha enviada para o e-mail cadastrado",
                    );
                  } else {
                    await GlobalsAlert(context).alertWarning(
                      title: "Atenção",
                      text: "Sem conexão com a internet",
                      onTap: Navigator.of(context, rootNavigator: true).pop,
                    );
                  }
                  // globalsStore.setLoading(false);
                },
                text: 'Enviar',
                icon: const Icon(Icons.login),
                options: FFButtonOptions(
                  width: 120,
                  height: 44.0,
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: ThemeModeApp.of(context).primary,
                  textStyle: ThemeModeApp.of(context).titleSmall.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
