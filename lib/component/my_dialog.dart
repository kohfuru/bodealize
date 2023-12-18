import 'package:flutter/material.dart';

void myDialog(context, String title, String text, VoidCallback? onPressed) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(text),
        actions: [
          FloatingActionButton(
            onPressed: onPressed,
            child: const Text('OK'),
          ),
        ],
      );
    }
  );
}