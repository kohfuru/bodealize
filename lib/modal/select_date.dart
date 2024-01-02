import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../firestore_reference.dart';

Future<Null> selectDate(BuildContext context, DateTime focusedDay) async {
  FirestoreReference firestoreReference = FirestoreReference();
  final QuerySnapshot snapshot = await firestoreReference.selectedDay.get();
  await initializeDateFormatting('ja_JP');

  String formattedDateTime = DateFormat('yyyy年MM月dd日（EEE）', 'ja_JP').format(focusedDay);

  if (snapshot.docs.isEmpty) {
    firestoreReference.lastSelectedDay.set({
      'dateString': formattedDateTime,
      'date': focusedDay
    });
  } else {
    firestoreReference.lastSelectedDay.update({
      'dateString': formattedDateTime,
      'date': focusedDay
    });
  }
}