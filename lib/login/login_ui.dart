import 'package:bodealize/component/appbar.dart';
import 'package:bodealize/component/my_button.dart';
import 'package:bodealize/login/handle_login.dart';
import 'package:bodealize/component/auth_textfield.dart';
import 'package:bodealize/login/to_signup.dart';
import 'package:flutter/material.dart';

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