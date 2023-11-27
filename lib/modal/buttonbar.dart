import 'package:bodealize/component/save_button.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        SaveButton(
          onPressed: () {},
          text: '保存',
          size: 15,
        ),
        SaveButton(
          onPressed: () {},
          text: '保存',
          size: 15,
        ),
        SaveButton(
          onPressed: () {},
          text: '保存',
          size: 15,
        ),
      ],
    );
  }
}