import 'package:flutter/material.dart';

class DialogShow {
  static void showLoading(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          contentTextStyle: const TextStyle(color: Colors.black, fontSize: 18),

          content: Row(
            children: [
              const CircularProgressIndicator(),
              Padding(padding: const EdgeInsets.all(8.0), child: Text(message)),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String title = '',
    String? postActiveName,
    Function? postAction,
  }) {
    final List<Widget> actions = [];
    if (postActiveName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            postAction?.call();
          },
          child: Text(postActiveName),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          title: Text(title),
          actions: actions,
        );
      },
    );
  }
}
