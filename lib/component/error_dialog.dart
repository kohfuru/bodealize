import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showErrorDialog(context, title, text, onPressed) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(text),
        actions: [
          CupertinoDialogAction(
            onPressed: onPressed,
            child: const Text('OK'),
          ),
        ],
      );
    }
  );
}