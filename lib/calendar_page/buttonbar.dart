import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  ButtonStyle customButtonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.orange)
    );
  }

  Text customButtonText(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 20
      ),
    );
  }

  TextButton customTextButton(onPressed, String text) {
    return TextButton(
      onPressed: onPressed,
      style: customButtonStyle(),
      child: customButtonText(text) ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        customTextButton((){}, 'text'),
        customTextButton((){}, 'text'),
        customTextButton((){}, 'text'),
      ],
    );
  }
}