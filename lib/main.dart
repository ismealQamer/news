import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news/core/l10n/app_localizations.dart';
import 'package:news/core/provider/app_config_provider.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/theme/app_theme.dart';
import 'package:news/ui/home/home_screen.dart';
import 'package:news/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: provider.themeMode,
      theme: AppTheme(LightColors()).theme,
      darkTheme: AppTheme(DarkColors()).theme,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName:(context) => HomeScreen(),
        },
      initialRoute: SplashScreen.routeName,
    );
  }
}
