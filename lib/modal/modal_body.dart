import 'package:flutter/material.dart';

import 'save_menu.dart';
import 'modal_textfield.dart';
import 'modal_datefield.dart';
import '/component/my_button.dart';

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

  @override
  Widget build(BuildContext context) {
    this.context =context;
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ModalTextField(
              onPressed: null,
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