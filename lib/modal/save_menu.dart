import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:bodealize/firestore_reference.dart';
import 'dialog_buttonbar_content.dart';

class SaveMenu {
  FirestoreReference firestoreReference = FirestoreReference();
  late Timestamp date;

  Future saveMenu(TextEditingController menuName, TextEditingController memo, BuildContext context) async {
    if (menuName.text.isNotEmpty) {
      firestoreReference.lastSelectedDay.get().then((DocumentSnapshot doc) async {
        final data = doc.data() as Map<String, dynamic>;
        date = data['date'];

        var menuData = {
          'menuName': menuName.text,
          'memo': memo.text,
          'date': date,
          'flag': false
        };

        firestoreReference.menus.add(menuData);

        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('メニューを保存しました'),
              actions: [
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    buttonBarContent(
                      () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      Colors.black45,
                      '完了'
                    ),
                    buttonBarContent(
                      () {
                        Navigator.pop(context);
                        menuName.clear();
                        memo.clear();
                      },
                      Colors.orange,
                      '続けて入力'
                    ),
                  ],
                )
              ],
            );
          }
        );
      });
    } else {
      return;
    }
  }
}