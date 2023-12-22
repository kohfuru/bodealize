import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:bodealize/firestore_reference.dart';

class SaveMenu {
  FirestoreReference firestoreReference = FirestoreReference();
  late String date;

  Future<bool> checkDocExists() async {
    final QuerySnapshot snapshot = await firestoreReference.menus.get();
    return snapshot.docs.isEmpty;
  }

  SizedBox buttonBarContent(onPressed, backColor, text) {
    return SizedBox(
      width: 100,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: backColor
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Future saveMenu(TextEditingController menuName, TextEditingController memo, BuildContext context) async {
    if (menuName.text.isNotEmpty) {

      firestoreReference.lastSelectedDay.get().then((DocumentSnapshot doc) async {
        final data = doc.data() as Map<String, dynamic>;
        date = data['date'];
        DocumentReference dateDoc = firestoreReference.menus.doc(date);
        CollectionReference menuCol = dateDoc.collection('menu');

        var menuData = {
          'menuName': menuName.text,
          'memo': memo.text,
        };

        menuCol.add(menuData);
        print('test1');

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