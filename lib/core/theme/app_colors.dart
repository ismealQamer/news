import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primaryColor;
  Color get onPrimaryColor;
  Color get secondaryColor;
  Color get onSecondaryColor;
  Color get surfaceColor;
  Color get onSurfaceColor;
  Color get errorColor;
  Color get onErrorColor;
  Brightness get brightness;
}

class LightColors implements AppColors {
  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get errorColor => Colors.red;

  @override
  Color get onErrorColor => Colors.white;

  @override
  Color get onPrimaryColor => Colors.white;

  @override
  Color get onSecondaryColor => Color(0xFF171717);

  @override
  Color get onSurfaceColor => Color(0xFF171717);

  @override
  Color get primaryColor => Color(0xFF171717);

  @override
  Color get secondaryColor => Color(0xFFA0A0A0);

  @override
  Color get surfaceColor => Colors.white;
}

class DarkColors implements AppColors {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get errorColor => Colors.red;

  @override
  Color get onErrorColor => Colors.white;

  @override
  Color get onPrimaryColor => Color(0xFF171717);

  @override
  Color get onSecondaryColor => Colors.white;

  @override
  Color get onSurfaceColor => Colors.white;

  @override
  Color get primaryColor => Colors.white;

  @override
  Color get secondaryColor => Color(0xFF171717);

  @override
  Color get surfaceColor =>  Color(0xFF171717);
}
