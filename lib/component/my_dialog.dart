import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future myDialog(context, String title, String text, VoidCallback? onPressed) async {

  TextButton okButton = TextButton(
    onPressed: onPressed,
    child: const Text(
      'OK',
      style: TextStyle(
          fontSize: 18
      ),
    ),
  );

  if (Platform.isAndroid) {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [okButton],
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
          actions: [okButton],
        );
      }
    );
  }
}