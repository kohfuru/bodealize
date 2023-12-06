import 'package:bodealize/component/my_button.dart';
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
        MyButton(
          onPressed: () {},
          text: 'メニューリストに保存',
          size: 15,
        ),
        MyButton(
          onPressed: () {},
          text: 'メモに保存',
          size: 15,
        ),
        MyButton(
          onPressed: () {},
          text: 'メニューリストとメモに保存',
          size: 15,
        ),
      ],
    );
  }
}