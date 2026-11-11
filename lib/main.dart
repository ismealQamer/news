import 'package:flutter/material.dart';
import 'package:news_app/core/provider/app_config_provider.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/core/l10n/app_localizations.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/ui/home/widgets/search_layout.dart';
import 'package:news_app/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppConfig(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfig>(
      builder: (context, provider, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: provider.themeMode,
        theme: AppTheme(LightAppColors()).theme,
        darkTheme: AppTheme(DarkAppColors()).theme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: provider.locale,
        routes: {
          SplashScreen.route: (_) => const SplashScreen(),
          HomeScreen.route: (_) => const HomeScreen(),
          SearchLayout.route: (context) {
            final arguments = ModalRoute.of(context)?.settings.arguments as List<Source>;
            return SearchLayout(sources: arguments);
          },
        },
        initialRoute: SplashScreen.route,
      ),
    );
  }
}