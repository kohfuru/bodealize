import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpModel extends ChangeNotifier {
  String mail = "";
  String password = "";
  String userName = "";

  //FirebaseAuthのインスタンスを生成
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signup(String? selectedGender) async {
    try {
      if (mail.isEmpty) {
        throw "メールアドレスを入力して下さい";
      }
      if (password.isEmpty) {
        throw "パスワードを入力して下さい";
      }
      if (userName.isEmpty) {
        throw "ユーザー名を入力して下さい";
      }
      if (selectedGender == null) {
        throw "性別を選択して下さい";
      }
      //Fire Auth に新規登録ユーザーの情報を書き込む
      final UserCredential user = await auth.createUserWithEmailAndPassword(
        email: mail,
        password: password,
      );

      final email = user.user!.email;
      // FireStoreに新規登録ユーザーの情報を書き込む
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.user!.uid)
          .set({
            "email": email,
            "password": password,
            "user_name": userName,
            "gender": selectedGender,
            // "createAt": Timestamp.now(),
          });
      print('新規登録が成功しました');
    } catch (e) {
      print('新規登録エラー: $e');
    }
  }

}