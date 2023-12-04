import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showErrorDialog(context, title, text) {
  showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(text),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    }
  );
}