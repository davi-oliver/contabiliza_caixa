import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ga_proj/app/services/company/store/companies_store.dart';
import 'package:ga_proj/app/services/home/store/home_store.dart';
import 'package:ga_proj/app/services/login/store/login_store.dart';
import 'package:ga_proj/app/services/perfil/configs/store/config_store.dart';
import 'package:ga_proj/app/services/perfil/store/perfil_store.dart';
import 'package:ga_proj/app/services/product/store/product_store.dart';
import 'package:ga_proj/app/services/sales/store/store_sale.dart';
import 'package:ga_proj/app/services/stock/store/stock_store.dart';
import 'package:ga_proj/app/store/serviceStore.dart'; 
import 'package:ga_proj/components/flutter_flow/internationalization.dart';
import 'package:ga_proj/components/flutter_flow/nav/nav.dart';
import 'package:ga_proj/global/store/global_store.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
 import 'package:supabase_flutter/supabase_flutter.dart';
import 'global/theme/theme_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    ThemeModeApp.initialize(),
  ]);
  await Supabase.initialize(
    url: 'https://rtsrqjtzvwjslrjhwnpv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ0c3JxanR6dndqc2xyamh3bnB2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM4MzYzMDMsImV4cCI6MjAyOTQxMjMwM30.bIFvyxhoVGoIinGIlXxpiP8rDr6GVkBFcKfl7o039ys',
  );
  runApp(MultiProvider(
    providers: [
      Provider<ServiceStore>(create: (_) => ServiceStore()),
      Provider<SaleStore>(create: (_) => SaleStore()),
      Provider<GlobalStore>(create: (_) => GlobalStore()),
      Provider<LoginStore>(create: (_) => LoginStore()),
      Provider<HomeStore>(create: (_) => HomeStore()),
      Provider<ConfigStore>(create: (_) => ConfigStore()),
      Provider<PerfilStore>(create: (_) => PerfilStore()),
      Provider<ProductStore>(create: (_) => ProductStore()),
      Provider<StockStore>(create: (_) => StockStore()),
      Provider<CompaniesStore>(create: (_) => CompaniesStore()),

 
    ],
    child: MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeModeApp.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);

    Future.delayed(Duration(milliseconds: 1000),
        () => setState(() => _appStateNotifier.stopShowingSplashImage()));
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        ThemeModeApp.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Contabiliza Caixa',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('pt'),
        Locale('en'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         Provider<ServiceStore>(create: (_) => ServiceStore()),
//       ],
//       child: const MaterialApp(
//         localizationsDelegates: [
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//         ],
//         supportedLocales: [
//           Locale('en', 'US'),
//           Locale(
//               'pt', 'BR'), // adicione pt_BR à lista de localidades suportadas
//         ],
//         locale: const Locale('pt', 'BR'),
//         // home: ViewRelatorio(),
//         home: ViewRelatorio(),
//       ),
//     );
//   }
// }
