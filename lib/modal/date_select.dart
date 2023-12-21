import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../firestore_reference.dart';

class SelectDate {
  FirestoreReference firestoreReference = FirestoreReference();
  DateTime _date = DateTime.now();

  Future<bool> checkCollectionExists() async {
    final QuerySnapshot snapshot = await firestoreReference.selectedDay.get();
    return snapshot.docs.isEmpty;
  }

  Future<Null> selectDate(context) async {
    await initializeDateFormatting('ja_JP');

    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      initialDate: _date
    );

    if (picked != null) {
      _date = picked;
      String formattedDateTime = DateFormat('yyyy年MM月dd日（EEE）', 'ja_JP').format(_date);

      if (await checkCollectionExists()) {
        firestoreReference.lastSelectedDay.set({'date': formattedDateTime});
      } else {
        firestoreReference.lastSelectedDay.update({'date': formattedDateTime});
      }
    }
  }
}