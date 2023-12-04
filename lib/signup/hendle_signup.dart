import 'package:bodealize/component/error_dialog.dart';
import 'package:bodealize/login/login_ui.dart';
import 'package:flutter/material.dart';

import '../auth/signup_auth.dart';

class HandleSignup {
  Future handleSignup(
    String emailText,
    String passwordText,
    String userName,
    String? gender,
    context,
  ) async {
    try {
      SignUpAuth sinUpAuth = SignUpAuth();
      await sinUpAuth.signup(emailText, passwordText, userName, gender);
      showErrorDialog(context, 'アカウントを作成しました', 'ログイン画面にてログインしてください');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    } catch(e) {
      showErrorDialog(context, 'アカウント作成に失敗しました', '必要な情報を入力してください');
    }
  }
}