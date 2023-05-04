import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ga_proj/app/services/geradorRelatorio/view_relatorio.dart';
import 'package:provider/provider.dart';

import 'app/services/service_contabiliza_caixa.dart';
import 'app/store/serviceStore.dart';
import 'global/theme/theme_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ServiceStore>(create: (_) => ServiceStore()),
      ],
      child: const MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale(
              'pt', 'BR'), // adicione pt_BR à lista de localidades suportadas
        ],
        locale: const Locale('pt', 'BR'),
        // home: ViewRelatorio(),
        home: CtbCaixa(),
      ),
    );
  }
}
