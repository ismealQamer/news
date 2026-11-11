import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;
  Color get onPrimary;
  Color get secondary;
  Color get onSecondary;
  Color get surface;
  Color get onSurface;
  Color get error;
  Color get onError;

  Brightness get brightness;
}

class LightAppColors extends AppColors {
  @override
  Color get primary => Color(0xFF171717);

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get secondary => Color(0xFFA0A0A0);

  @override
  Color get onSecondary => Color(0xFF171717);

  @override
  Color get surface => Colors.white;

  @override
  Color get onSurface => Color(0xFF171717);

  @override
  Color get error => Colors.red;

  @override
  Color get onError => Colors.white;

  @override
  Brightness get brightness => Brightness.light;
}

class DarkAppColors extends AppColors {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get error => Colors.red;

  @override
  Color get onError => Colors.white;

  @override
  Color get onPrimary => Color(0xFF171717);

  @override
  Color get onSecondary => Colors.white;

  @override
  Color get onSurface => Colors.white;

  @override
  Color get primary => Colors.white;

  @override
  Color get secondary => Color(0xFF171717);

  @override
  Color get surface => Color(0xFF171717);
}