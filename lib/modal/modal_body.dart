import 'package:bodealize/firestore_reference.dart';
import 'package:bodealize/menu_list/menu_list.dart';
import 'package:bodealize/modal/date_select.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bodealize/modal/modal_textfield.dart';
import 'package:bodealize/modal/modal_categoryfield.dart';

import '../component/my_button.dart';

class ModalBody extends StatefulWidget {
  const ModalBody({super.key});

  @override
  State<ModalBody> createState() => _ModalBodyState();
}

class _ModalBodyState extends State<ModalBody> {
  final _menuNameController = TextEditingController();
  final _memoController = TextEditingController();
  @override
  late BuildContext context;
  FirestoreReference firestoreReference = FirestoreReference();

  @override
  Widget build(BuildContext context) {
    this.context =context;
    return Material(
      child: SingleChildScrollView(
          child: Column(
            children: [
              ModalTextField(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MenuList(),
                    ),
                  );
                },
                icon: Icons.list,
                controller: _menuNameController,
                hintText: 'メニュー',
                autofocus: true,
                height: 50,
                padding: 0,
              ),
              const Divider(color: Colors.grey),
              const DateSelect(),
              const Divider(color: Colors.grey),
              ModalTextField(
                onPressed: null,
                icon: Icons.menu_book,
                controller: _memoController,
                hintText: 'メモを入力',
                autofocus: false,
                height: 150,
                padding: 50,
              ),
              const Divider(color: Colors.grey),
              MyButton(
                onPressed: () async {
                  QuerySnapshot snapshot = await firestoreReference.trueSelected.get();
                  CollectionReference menus = snapshot.docs.first.reference.collection('menus');

                  if (_menuNameController.text.isEmpty || _memoController.text.isEmpty) {
                    return;
                  } else {
                    await menus.add({
                      'menuName': _menuNameController.text,
                      'menuMemo': _memoController.text
                    });
                  }

                },
                text: '保存',
                size: 15,
                paddingTop: 20,
              )
            ],
          )
      ),
    );
  }
}