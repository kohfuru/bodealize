import 'package:bodealize/menu_list/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:bodealize/modal/buttonbar.dart';
import 'package:bodealize/category/category.dart';
import 'package:bodealize/modal/modal_textfield.dart';
import 'package:bodealize/modal/select_categoryfield.dart';


class ModalBody extends StatefulWidget {
  const ModalBody({super.key});

  @override
  State<ModalBody> createState() => _ModalBodyState();
}

class _ModalBodyState extends State<ModalBody> {
  final padding = const EdgeInsets.only(left: 3);

  final _menuNameController = TextEditingController();
  final _memoController = TextEditingController();

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context =context;
    return Column(
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
          hintText: 'メニュー名',
          autofocus: true,
        ),
        const Divider(color: Colors.grey),
        const SelectCategory(),
        const Divider(color: Colors.grey),
        ModalTextField(
          onPressed: null,
          icon: Icons.menu_book,
          controller: _memoController,
          hintText: 'メモを入力',
          autofocus: false,
        ),
        const Divider(color: Colors.grey),
        Padding(
          padding: padding,
          child: const ButtonWidget()
        )
      ],
    );
  }
}