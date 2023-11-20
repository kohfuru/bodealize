import 'package:flutter/material.dart';
import 'package:bodealize/calendar_page/buttonbar.dart';
import 'package:bodealize/calendar_page/category.dart';
import 'package:bodealize/calendar_page/modal_textfield.dart';
import 'package:bodealize/calendar_page/select_categoryfield.dart';


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
          controller: _menuNameController,
          hintText: 'メニュー名',
        ),
        const Divider(color: Colors.grey),
        SelectCategory(),
        const Divider(color: Colors.grey),
        ModalTextField(
          controller: _memoController,
          hintText: 'メモを入力',
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