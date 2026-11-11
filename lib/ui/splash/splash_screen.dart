import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/context_extention.dart';
import 'package:news_app/ui/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.appConfig;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                provider.themeMode == ThemeMode.dark
                    ? AppAssets.logoDark
                    : AppAssets.logoLight,
              ),
            ),
            Image.asset(
              provider.themeMode == ThemeMode.dark
                  ? AppAssets.brandingDark
                  : AppAssets.brandingLight,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ],
        ),
      ),
    );
  }
}
