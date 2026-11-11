import 'package:flutter/material.dart';

import 'package:news_app/core/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import 'dialog_utils.dart';

extension BuildContextExtensions on BuildContext {
  AppConfig get appConfig => Provider.of<AppConfig>(this);
  AppConfig get appConfigListenFalse =>
      Provider.of<AppConfig>(this, listen: false);
  T read<T>() => Provider.of<T>(this, listen: false);
  T watch<T>() => Provider.of<T>(this, listen: true);

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextTheme get text => textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ColorScheme get colors => colorScheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  AppLocalizations get locale => AppLocalizations.of(this)!;

  NavigatorState get navigator => Navigator.of(this);

  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  void pop<T>([T? result]) {
    Navigator.pop(this, result);
  }

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  void showDialogUtils({
    String message = 'Loading',
    bool barierDismissable = false,
  }) {
    final DialogUtils dialogUtils = DialogUtils();
    dialogUtils.showAlertDialog(
      this,
      message: message,
      barierDismissable: barierDismissable,
    );
  }

  Future<void> showActionDialog({
    String? message,
    String? title,
    String? postActionTitle,
    Future<void> Function()? negativeAction,
    Future<void> Function()? postAction,
    String? negativeActionTitle,
    bool barierDismissable = false,
  }) async {
    final DialogUtils dialogUtils = DialogUtils();
    dialogUtils.showActionDialog(
      this,
      message: message,
      title: title,
      postActionTitle: postActionTitle,
      postAction: postAction,
      negativeAction: negativeAction,
      negativeActionTitle: negativeActionTitle,
      barierDismissable: barierDismissable,
    );
  }
}