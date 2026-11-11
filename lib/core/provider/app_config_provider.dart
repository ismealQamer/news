import 'package:flutter/material.dart';


class AppConfig extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;
  Locale _locale = const Locale('en');

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void changeTheme(ThemeMode theme) {
    if (_themeMode == theme) return;
    _themeMode = theme;
    notifyListeners();
  }

  void changeLanguage(String languageCode) {
    if (_locale.languageCode == languageCode) return;
    _locale = Locale(languageCode);
    notifyListeners();
  }
  
}