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



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'メニュー名',
              contentPadding: padding,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey
                )
              )
              //   クリアボタンを置く
            ),
          ),
        ),
        Padding(
          padding: padding,
          child: SizedBox(
            width: double.infinity,
            child: TextField(
              controller: TextEditingController(
                text: 'category',
              ),
              readOnly: true,
              decoration: InputDecoration(
                contentPadding: padding
              ),
            ),
          ),
        ),
        Padding(
          padding: padding,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'メモを入力',
              contentPadding: padding,
              //   クリアボタンを置く
            ),
          ),
        ),
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