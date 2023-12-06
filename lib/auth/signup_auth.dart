import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpAuth {

  Future<void> signup(String emailAddress, String password, String userName, String? gender) async {
    var db = FirebaseFirestore.instance;

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      
      await credential.user!.updateDisplayName(userName);

      var uid = credential.user!.uid;

      final user = {
        "uid": uid,
        "emailAddress": emailAddress,
        "userName": userName,
        "gender": gender,
      };

      db
        .collection('users')
        .doc(uid)
        .set(user)
        .then((_) => print('User added to Firestore'))
        .catchError((onError) => print('Error adding user to Firestore: $onError'));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('パスワードが弱すぎます');
      } else if (e.code == 'email-already-in-use') {
        print('すでにこのメールアドレスでアカウントが作成されています');
      }
      rethrow;
    }
  }
}