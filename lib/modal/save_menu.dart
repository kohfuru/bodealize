import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/firestore_reference.dart';

class SaveMenu {
  FirestoreReference firestoreReference = FirestoreReference();
  late Timestamp date;

  Future saveMenu(TextEditingController menuName, TextEditingController memo, BuildContext context) async {
    if (menuName.text.isNotEmpty) {
      firestoreReference.lastSelectedDay.get().then((DocumentSnapshot doc) async {
        final data = doc.data() as Map<String, dynamic>;
        date = data['date'];
        Text title = const Text('メニューを保存しました');

        TextButton completeButton = TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Text(
            '完了',
            style: TextStyle(
              fontSize: 17
            ),
          )
        );

        TextButton continueButton = TextButton(
          onPressed: () {
            Navigator.pop(context);
            menuName.clear();
            memo.clear();
          },
          child: const Text(
            '続けて入力',
            style: TextStyle(
              fontSize: 17,
            ),
          )
        );

        List<TextButton> actions = [completeButton, continueButton];

        var menuData = {
          'menuName': menuName.text,
          'memo': memo.text,
          'date': date,
          'flag': false
        };

        firestoreReference.menus.add(menuData);

        if (Platform.isAndroid) {
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: title,
                actions: actions,
              );
            }
          );
        } else if (Platform.isIOS) {
          await showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: title,
                actions: actions,
              );
            }
          );
        }
      });
    } else {
      return;
    }
  }
}