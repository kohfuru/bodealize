import 'package:bodealize/menu_list/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:bodealize/modal/modal_textfield.dart';

import '../component/my_button.dart';
import 'modal_datefield.dart';

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
                if (_menuNameController.text.isNotEmpty) {
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
                                () => Navigator.pop(context),
                                Colors.orange,
                                '続けて入力'
                              ),
                            ],
                          )
                        ],
                      );
                    }
                  );
                } else {
                  return;
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