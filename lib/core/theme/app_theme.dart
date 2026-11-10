import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';

class AppTheme {
  AppColors appColors;

  AppTheme(this.appColors);

  ThemeData get theme => ThemeData(
    colorScheme: ColorScheme(
      brightness:appColors.brightness,
       primary: appColors.primaryColor,
        onPrimary: appColors.onPrimaryColor,
         secondary: appColors.secondaryColor,
          onSecondary: appColors.onSecondaryColor,
           error: appColors.errorColor,
            onError: appColors.onErrorColor,
             surface: appColors.surfaceColor,
              onSurface: appColors.onSurfaceColor,
              )
  );
}
