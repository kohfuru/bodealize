import 'package:flutter/material.dart';

import 'package:bodealize/firestore_reference.dart';
import 'package:bodealize/menu_list/menu_list.dart';
import 'package:bodealize/modal/save_menu.dart';
import 'package:bodealize/modal/modal_textfield.dart';
import '../component/my_button.dart';
import 'date_select.dart';
import 'modal_datefield.dart';

class ModalBody extends StatefulWidget {
  const ModalBody({super.key});

  @override
  State<ModalBody> createState() => _ModalBodyState();
}

class _ModalBodyState extends State<ModalBody> {
  FirestoreReference firestoreReference = FirestoreReference();
  final _menuNameController = TextEditingController();
  final _memoController = TextEditingController();
  @override
  late BuildContext context;
  late String? date;
  SelectDate selectDate = SelectDate();
  late Future<bool> checkDocExists;

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
              onPressed: () => SaveMenu().saveMenu(_menuNameController, _memoController, context),
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