import 'package:flutter/material.dart';

import '../component/clear_button.dart';
import '../component/save_button.dart';

class LoginBody extends StatefulWidget {
  final VoidCallback? onPressed;
  final String text;

  const LoginBody({
    required this.onPressed,
    required this.text,
    super.key
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.8;
    double textFieldHeight = screenHeight * 0.06;

    Padding textField(double paddingTop, TextEditingController controller, hintText) {
      return Padding(
        padding: EdgeInsets.only(top: paddingTop),
        child: SizedBox(
          width: textFieldWidth,
          height: textFieldHeight,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              suffixIcon: ClearButton(controller: controller),
              hintText: hintText,
              contentPadding: const EdgeInsets.only(top: 30, left: 10),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        textField(100, _emailController, 'メールアドレス'),
        textField(35, _passController, 'パスワード'),
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: SizedBox(
              width: screenWidth * 0.6,
              height: textFieldHeight,
              child: SaveButton(
                onPressed: widget.onPressed,
                text: widget.text,
                size: 18,
              )
          ),
        ),
      ],
    );
  }
}