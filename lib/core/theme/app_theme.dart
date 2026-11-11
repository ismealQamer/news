// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';

class AppTheme {
  AppColors appColors;

  AppTheme(this.appColors);

  ThemeData get theme => ThemeData(
    colorScheme: ColorScheme(
      brightness: appColors.brightness,
      primary: appColors.primary,
      onPrimary: appColors.onPrimary,
      secondary: appColors.secondary,
      onSecondary: appColors.onSecondary,
      error: appColors.error,
      onError: appColors.onError,
      surface: appColors.surface,
      onSurface: appColors.onSurface,
    ),
  );
}