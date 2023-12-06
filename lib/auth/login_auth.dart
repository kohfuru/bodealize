import 'package:firebase_auth/firebase_auth.dart';

class LoginAuth {
  Future<void> login(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
      );
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
      if (e.code == 'user-not-found') {
        print('ユーザーが見つかりませんでした。');
      } else if (e.code == 'wrong-password') {
        print('パスワードが正しくありません');
      }
      rethrow;
    }
  }
}