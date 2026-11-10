import 'package:flutter/material.dart';
import 'package:news/core/l10n/app_localizations.dart';
import 'package:news/core/provider/app_config_provider.dart';
import 'package:news/core/utils/dialog_utils.dart';
import 'package:provider/provider.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;

  ColorScheme get colors => Theme.of(this).colorScheme;

  TextTheme get text => Theme.of(this).textTheme;

  AppConfigProvider get provider => Provider.of<AppConfigProvider>(this);

  void showLoadingDialog({
    String message = "Loading ...",
    bool barrierDismissible = false,
  }) {
    final DialogUtils dialogUtils = DialogUtils();
    dialogUtils.showLoadingDialog(
      this,
      message: message,
      barrierDismissible: barrierDismissible,
    );
  }

  Future<void> showActionDialog({
    String? message,
    String? title,
    String? postActionTitle,
    Future<void> Function()? postAction,
    String? negativeActionTitle,
    Future<void> Function()? negativeAction,
    bool barrierDismissible = false,
  })async{
    final DialogUtils dialogUtils = DialogUtils();
    await dialogUtils.showActionDialog(
      this,
      message: message,
      title: title,
      postActionTitle: postActionTitle,
      postAction: postAction,
      negativeActionTitle: negativeActionTitle,
      negativeAction: negativeAction,
      barrierDismissible: barrierDismissible,
    );
  }
}