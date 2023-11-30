import 'package:bodealize/component/appbar.dart';
import 'package:bodealize/login/login_textfield.dart';
import 'package:bodealize/login/signup_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../auth/login_auth.dart';
import '../home.dart';
import 'login_button.dart';

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
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'ログイン画面',
        actions: [],
        backButton: true,
      ),
      body: Center(
        child: Column(
          children: [
            LoginTextField(
              paddingTop: 100,
              controller: _emailController,
              hintText: 'メールアドレス'
            ),
            LoginTextField(
                paddingTop: 35,
                controller: _passController,
                hintText: 'パスワード'
            ),
            LoginButton(
              paddingTop: 35,
              onPressed: () async {
                LoginAuth loginAuth = LoginAuth();

                await loginAuth.login(_emailController.text, _passController.text);

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              text: 'ログイン',
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