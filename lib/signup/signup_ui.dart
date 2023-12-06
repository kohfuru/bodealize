import 'package:bodealize/component/appbar.dart';
import 'package:bodealize/signup/hendle_signup.dart';
import 'package:bodealize/component/auth_button.dart';
import 'package:bodealize/component/auth_textfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userNameController = TextEditingController();

  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: '新規登録',
        actions: [],
        backButton: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              LoginTextField(
                  paddingTop: 50,
                  controller: _emailController,
                  hintText: 'メールアドレス'
              ),
              LoginTextField(
                  paddingTop: 35,
                  controller: _passwordController,
                  hintText: 'パスワード(6文字以上)'
              ),
              LoginTextField(
                  paddingTop: 35,
                  controller: _userNameController,
                  hintText: 'ユーザー名'
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: DropdownButton<String>(
                  value: _selectedGender,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                  items: <String>['男性', '女性', 'その他']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: const Text('性別を選択してください'),
                  underline: Container(  // 枠線
                    height: 2,
                    color: Colors.blue, // 枠線の色
                  ),
                ),
              ),
              LoginButton(
                paddingTop: 35,
                onPressed: () async {
                  await HandleSignup().handleSignup(
                    _emailController.text,
                    _passwordController.text,
                    _userNameController.text,
                    _selectedGender,
                    context
                  );
                },
                text: '新規登録',
              )
            ],
          )
        )
      )
    );
  }
}