import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreReference {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference get users => db.collection('users');
  String? get uid => auth.currentUser?.uid;
  DocumentReference get userDoc => users.doc(uid);
  CollectionReference get selectedDay => userDoc.collection('selectedDay');
  DocumentReference get lastSelectedDay => selectedDay.doc('lastSelectedDay');
  CollectionReference<Map<String, dynamic>> get menus => userDoc.collection('menus');
}