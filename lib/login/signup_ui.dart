import 'package:bodealize/auth/signup_auth.dart';
import 'package:bodealize/component/appbar.dart';
import 'package:bodealize/home.dart';
import 'package:bodealize/login/login_button.dart';
import 'package:bodealize/login/login_textfield.dart';
import 'package:flutter/material.dart';
// import 'package:bodealize/auth/signup_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
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
        body: Center(
            child: Column(
              children: [
                LoginTextField(
                    paddingTop: 50,
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
                    // SignUpMo// delのインスタンスを生成
                    SignUpModel signUpModel = SignUpModel();

                    signUpModel.mail = _emailController.text;
                    signUpModel.password = _passController.text;
                    signUpModel.userName = _userNameController.text;

                    // 新規登録を実行
                    await signUpModel.signup();

                    // 新規登録が成功したらホームページに移動
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  text: '新規登録',
                )
              ],
            )
        )
    );
  }
}