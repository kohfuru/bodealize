import 'package:bodealize/component/appbar.dart';
import 'package:bodealize/login/login_button.dart';
import 'package:bodealize/login/login_textfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: '新規登録',
        actions: [],
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
            LoginTextField(
              paddingTop: 35,
              controller: _userNameController,
              hintText: 'ユーザー名'
            ),
            const LoginButton(
              paddingTop: 35,
              onPressed: null,
              text: '新規登録',
            )
          ],
        )
      )
    );
  }
}