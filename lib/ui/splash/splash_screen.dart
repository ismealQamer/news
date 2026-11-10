import 'package:flutter/material.dart';
import 'package:news/core/provider/app_config_provider.dart';
import 'package:news/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash_screen';
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),()
   { Navigator.pushReplacementNamed(context,HomeScreen.routeName);}

    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/news_logo_${provider.isDarkMode() ? "dark" : "light"}.png",
            ),
          ),
          Image.asset(
            "assets/images/news_branding_${provider.isDarkMode() ? "dark" : "light"}.png",
            width: MediaQuery.sizeOf(context).width * 0.6,
          ),
        ],
      ),
    );
  }
}
