import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {

  ButtonStyle customButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: const Size(120, 60),
      backgroundColor: Colors.orange
    );
  }

  Text customButtonText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold
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
        customTextButton((){}, '保存'),
        customTextButton((){}, '保存して追加'),
        customTextButton((){}, '追加'),
      ],
    );
  }
}