import 'package:bodealize/component/my_dialog.dart';
import 'package:bodealize/login/login_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      if (emailText.isEmpty || passwordText.isEmpty || userName.isEmpty || gender == null) {
        myDialog(
          context,
          '入力エラー',
          '必要な情報を入力してください',
          () => Navigator.pop(context)
        );
        return;
      }

      SignUpAuth sinUpAuth = SignUpAuth();
      await sinUpAuth.signup(emailText, passwordText, userName, gender);

      myDialog(
        context,
        'アカウントを作成しました',
        'ログイン画面にてログインしてください',
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        )
      );
    } catch(e) {
      String errorMessage = '正しい情報を入力してください';
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          errorMessage = 'パスワードが弱すぎます';
          print('パスワードが弱すぎます');
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'すでにこのメールアドレスでアカウントが作成されています';
          print('すでにこのメールアドレスでアカウントが作成されています');
        }
      }
      myDialog(
        context,
        'アカウント作成に失敗しました',
        errorMessage,
        () => Navigator.pop(context)
      );
    }
  }
}