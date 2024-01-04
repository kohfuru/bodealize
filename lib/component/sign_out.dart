import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/firestore_reference.dart';

Future signOutDialog(BuildContext context) async {
  FirestoreReference firestoreReference = FirestoreReference();

  Text title = const Text('サインアウトします');
  Text content = const Text('よろしいですか？');

  TextButton cancelButton = TextButton(
    child: const Text('キャンセル'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  TextButton okButton = TextButton(
    child: const Text('OK'),
    onPressed: () {
      firestoreReference.auth.signOut();
      Navigator.of(context).pop();
    },
  );

  List<TextButton> actions = [cancelButton, okButton];

  if (Platform.isAndroid) {
    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: title,
        content: content,
        actions: actions,
      )
    );
  } else if (Platform.isIOS) {
    await showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actions,
      )
    );
  }
}