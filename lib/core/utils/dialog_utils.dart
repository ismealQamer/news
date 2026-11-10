
import 'package:flutter/material.dart';
import 'package:news/core/utils/numbers_extension.dart';


class DialogUtils {
  Future<void> showLoadingDialog(
    BuildContext context, {
    String message = "Loading ...",
    bool barrierDismissible = false,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            8.horizontalSpace,
            Text(message),
          ],
        ),
      ),
    );
  }

  Future<void> showActionDialog(
    BuildContext context, {
    String? message,
    String? title,
    String? postActionTitle,
    Future<void> Function()? postAction,
    String? negativeActionTitle,
    Future<void> Function()? negativeAction,
    bool barrierDismissible = false,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: title != null ? Text(title) : null,
        content: message != null ? Text(message) : null,
        actions: [
          if (postActionTitle != null)
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                if (postAction != null) {
                  await postAction();
                }
              },
              child: Text(postActionTitle),
            ),
          if (negativeActionTitle != null)
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                if (negativeAction != null) {
                  await negativeAction();
                }
              },
              child: Text(negativeActionTitle),
            ),
        ],
      ),
    );
  }
}