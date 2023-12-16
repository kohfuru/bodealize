import 'package:firebase_auth/firebase_auth.dart';

Future<String> readUid() async {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  return uid;
}