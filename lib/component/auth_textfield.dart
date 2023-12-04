import 'package:flutter/material.dart';

import 'clear_button.dart';

class LoginTextField extends StatefulWidget {
  final double paddingTop;
  final TextEditingController controller;
  final String hintText;

  const LoginTextField({
    required this.paddingTop,
    required this.controller,
    required this.hintText,
    super.key
  });

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.8;
    double textFieldHeight = screenHeight * 0.06;

    return Padding(
      padding: EdgeInsets.only(top: widget.paddingTop),
      child: SizedBox(
        width: textFieldWidth,
        height: textFieldHeight,
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: ClearButton(controller: widget.controller),
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.only(top: 30, left: 10),
          ),
        ),
      ),
    );
  }
}