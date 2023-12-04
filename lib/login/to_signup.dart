import 'package:bodealize/signup/signup_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ToSignUp extends StatelessWidget {
  const ToSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: [
            const TextSpan(text: '新規登録は '),
            TextSpan(
              text: 'こちら',
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                .. onTap = () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}