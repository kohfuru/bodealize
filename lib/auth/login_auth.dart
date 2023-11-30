import 'package:firebase_auth/firebase_auth.dart';

class LoginAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw "メールアドレスとパスワードを入力してください";
      }

      // ログイン処理
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('ログインが成功しました');
    } catch (e) {
      print('ログインエラー: $e');
      throw e; // エラーを呼び出し元にも伝える
    }
  }
}
