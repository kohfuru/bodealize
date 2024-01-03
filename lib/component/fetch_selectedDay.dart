import 'package:cloud_firestore/cloud_firestore.dart';

import '../firestore_reference.dart';

Future<DateTime?> fetchSelectedDay() async {
  FirestoreReference firestoreReference = FirestoreReference();
  DocumentSnapshot doc = await firestoreReference.lastSelectedDay.get();

  if (doc.exists) {
    final data = doc.data() as Map<String, dynamic>;
    final date =  data['date'].toDate();
    print(date);
  } else {
    print('error');
  }
}