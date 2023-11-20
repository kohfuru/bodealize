import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bodealize/calendar_page/buttonbar.dart';
import 'package:bodealize/calendar_page/category.dart';

class MemoTextField extends StatefulWidget {
  const MemoTextField({super.key});

  @override
  State<MemoTextField> createState() => _MemoTextFieldState();
}

class _MemoTextFieldState extends State<MemoTextField> {
  final padding = const EdgeInsets.only(left: 3);

  final _menuNameController = TextEditingController();
  final _memoController = TextEditingController();

  final clearButton = Icons.clear;
  final arrowButton = Icons.arrow_forward_ios;

  late BuildContext context;

  void controllerClear(TextEditingController controller) => controller.clear();
  void routePage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const CategoryPage()),
    );
  }

  UnderlineInputBorder customUnderlineInputBorder() {
    return const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blueGrey
        )
    );
  }

  InputDecoration  customInputDecoration(String hintText, onPressed, icon) {
    return InputDecoration(
      contentPadding: padding,
      border: InputBorder.none,
      hintText: hintText,
      suffixIcon: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      )
    );
  }

  Expanded customTextField(controller, String hintText, onPressed, icon) {
    return Expanded(
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 20
        ),
        decoration: customInputDecoration(hintText, onPressed, icon)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    this.context =context;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.list)
            ),
            customTextField(_menuNameController, 'メニュー名', () => controllerClear(_menuNameController), clearButton),
          ],
        ),
        const Divider(color: Colors.grey),
        TextField(
          style: const TextStyle(
            fontSize: 20
          ),
          controller: TextEditingController(
            text: 'category',
          ),
          readOnly: true,
          decoration: customInputDecoration('', () => routePage(), arrowButton)
        ),
        const Divider(color: Colors.grey),
        Row(
          children: [
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.menu_book,
                color: Colors.black,
              )
            ),
            customTextField(_memoController, 'メモを入力', () => controllerClear(_memoController), clearButton),
          ],
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