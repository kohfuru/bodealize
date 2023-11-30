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
  String _errorMessage = '';

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
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(50),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20
                  ),
                ),
              )
            else
              const SizedBox(
                height: 129,
              ),
            LoginTextField(
              paddingTop: 0,
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
                try {
                  LoginAuth loginAuth = LoginAuth();

                  await loginAuth.login(_emailController.text, _passController.text);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                } catch(e) {
                  setState(() {
                    _errorMessage = 'ログインに失敗しました';
                  });
                }

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