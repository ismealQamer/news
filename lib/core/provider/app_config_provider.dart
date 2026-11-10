import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  void changeTheme(ThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
  }

  bool isDarkMode() {
    return themeMode == ThemeMode.dark;
  }
}
