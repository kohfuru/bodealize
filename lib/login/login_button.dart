import 'package:flutter/material.dart';

import '../component/save_button.dart';

class LoginButton extends StatefulWidget {
  final double paddingTop;
  final VoidCallback? onPressed;
  final String text;

  const LoginButton({
    required this.paddingTop,
    required this.onPressed,
    required this.text,
    super.key
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.8;
    double textFieldHeight = screenHeight * 0.06;

    return Padding(
      padding: EdgeInsets.only(top: widget.paddingTop),
      child: SizedBox(
          width: screenWidth * 0.6,
          height: textFieldHeight,
          child: SaveButton(
            onPressed: widget.onPressed,
            text: widget.text,
            size: 18,
          )
      ),
    );
  }
}