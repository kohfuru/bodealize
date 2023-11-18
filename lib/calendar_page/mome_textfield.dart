import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class MemoTextField extends StatefulWidget {
  const MemoTextField({super.key});

  @override
  State<MemoTextField> createState() => _MemoTextFieldState();
}

class _MemoTextFieldState extends State<MemoTextField> {
  final padding = const EdgeInsets.all(10);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding,
          child: TextField(
            decoration: customInputDecoration('メニュー名')
          ),
        ),
        const Divider(color: Colors.grey),
        Padding(
          padding: padding,
          child: TextField(
            controller: TextEditingController(
              text: 'category',
            ),
            readOnly: true,
            decoration: customInputDecoration('')
          ),
        ),
        const Divider(color: Colors.grey),
        Padding(
          padding: padding,
          child: TextField(
            decoration: customInputDecoration('メモを入力')
          ),
        ),
        const Divider(color: Colors.grey),
        Padding(
          padding: padding,
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange)
              ),
              child: const Text(
                '保存',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}