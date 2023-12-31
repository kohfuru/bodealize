import 'package:flutter/material.dart';

import '/auth/login_auth.dart';
import '/home.dart';
import '/component/my_dialog.dart';

class HandleLogin {

  Future handleLogin(String emailText, String passwordText, context) async {
    try {
      if (emailText.isEmpty || passwordText.isEmpty) {
        myDialog(
          context,
          '入力エラー',
          'メールアドレスとパスワードを入力してください',
          () => Navigator.pop(context)
        );
        return;
      }
      LoginAuth loginAuth = LoginAuth();
      await loginAuth.login(emailText, passwordText);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } catch(e) {
      myDialog(
        context,
        'ログインに失敗しました',
        '正しい情報を入力してください',
        () => Navigator.pop(context)
      );
    }
  }
}