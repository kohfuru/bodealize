import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../firestore_reference.dart';

Future<Null> selectDateAndroid(context) async {
  FirestoreReference firestoreReference = FirestoreReference();
  DateTime date = DateTime.now();
  await initializeDateFormatting('ja_JP');
  final QuerySnapshot snapshot = await firestoreReference.selectedDay.get();

  final DateTime? picked = await showDatePicker(
    context: context,
    firstDate: DateTime(2000),
    lastDate: DateTime(2050),
    initialDate: date
  );

  if (picked != null) {
    date = picked;
    String formattedDateTime = DateFormat('yyyy年MM月dd日（EEE）', 'ja_JP').format(date);

    if (snapshot.docs.isEmpty) {
      firestoreReference.lastSelectedDay.set({
        'dateString': formattedDateTime,
        'date': date
      });
    } else {
      firestoreReference.lastSelectedDay.update({
        'dateString': formattedDateTime,
        'date': date
      });
    }
  }
}