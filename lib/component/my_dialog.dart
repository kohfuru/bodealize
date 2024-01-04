import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future myDialog(context, String title, String text, VoidCallback? onPressed) async {
  if (Platform.isAndroid) {
    await showDialog(
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
  } else if (Platform.isIOS) {
    await showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: const Text(
                'OK',
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}