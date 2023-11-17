import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class MemoTextField extends StatefulWidget {
  const MemoTextField({super.key});

  @override
  State<MemoTextField> createState() => _MemoTextFieldState();
}

class _MemoTextFieldState extends State<MemoTextField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            hintText: 'メモを入力してください',
            contentPadding: EdgeInsets.all(10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
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