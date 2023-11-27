import 'package:bodealize/component/appbar.dart';
import 'package:bodealize/component/clear_button.dart';
import 'package:bodealize/login/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double textFieldWidth = screenWidth * 0.8;
    double textFieldHeight = screenHeight * 0.06;

    Padding textField(double paddingTop, TextEditingController controller) {
      return Padding(
        padding: EdgeInsets.only(top: paddingTop),
        child: SizedBox(
          width: textFieldWidth,
          height: textFieldHeight,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              suffixIcon: ClearButton(controller: controller)
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: const AppBarWidget(
        title: 'ログイン画面',
        actions: [],
      ),
      body: Center(
        child: Column(
          children: [
            textField(100, _emailController),
            textField(50, _passController),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                width: screenWidth * 0.6,
                height: textFieldHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    fixedSize: const Size(120, 60),
                    backgroundColor: Colors.orange
                  ),
                  child: const Text(
                    'ログイン',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    )
                  ),
                ),
              ),
            ),
            Padding(
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
            )
          ],
        ),
      )
    );
  }
}