import 'package:flutter/material.dart';

import 'handle_login.dart';
import 'to_signup.dart';
import '/component/appbar.dart';
import '/component/my_button.dart';
import '/component/auth_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        leading: SizedBox(),
        title: 'ログイン画面',
        actions: [],
        backButton: false,
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
                controller: _passwordController,
                hintText: 'パスワード'
            ),
            MyButton(
              onPressed: () async {
                await HandleLogin().handleLogin(
                  _emailController.text,
                  _passwordController.text,
                  context
                );
              },
              text: 'ログイン',
              size: 18,
              paddingTop: 35,
            ),
            const ToSignUp()
          ],
        ),
      )
    );
  }
}