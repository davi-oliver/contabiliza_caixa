
import 'package:flutter/material.dart';
import 'package:ga_proj/global/theme/theme_mode.dart';

class CompanyWidgets{
  BuildContext context;
  CompanyWidgets(this.context);

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
              color: ThemeModeApp.of(context).secondaryBackground),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // perfilFotoName(),
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
                            "Fornecedores",
                            style: ThemeModeApp.of(context).labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // botoesConfiguracaoEConta(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}