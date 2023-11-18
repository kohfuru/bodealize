import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bodealize/calendar_page/buttonbar.dart';

class MemoTextField extends StatefulWidget {
  const MemoTextField({super.key});

  @override
  State<MemoTextField> createState() => _MemoTextFieldState();
}

class _MemoTextFieldState extends State<MemoTextField> {
  final padding = const EdgeInsets.only(left: 10);

  UnderlineInputBorder customUnderlineInputBorder() {
    return const UnderlineInputBorder(
        borderSide: BorderSide(
            color: Colors.blueGrey
        )
    );
  }

  InputDecoration  customInputDecoration(String hintText) {
    return InputDecoration(
      contentPadding: padding,
      border: InputBorder.none,
      hintText: hintText,
    );
  }

  TextField customTextField(String hintText) {
    return TextField(
      style: const TextStyle(
        fontSize: 20
      ),
      decoration: customInputDecoration(hintText)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customTextField('メニュー名'),
        const Divider(color: Colors.grey),
        TextField(
          style: const TextStyle(
            fontSize: 20
          ),
          controller: TextEditingController(
            text: 'category',
          ),
          readOnly: true,
          decoration: customInputDecoration('')
        ),
        const Divider(color: Colors.grey),
        customTextField('メモを入力'),
        const Divider(color: Colors.grey),
        Padding(
          padding: padding,
          child: const ButtonWidget()
        )
      ],
    );
  }
}