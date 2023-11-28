import 'package:bodealize/component/appbar.dart';
import 'package:bodealize/login/body_com.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: '新規登録',
        actions: [],
      ),
      body: Center(
        child: LoginBody(
          onPressed: null,
          text: '新規登録'
        ),
      )
    );
  }
}