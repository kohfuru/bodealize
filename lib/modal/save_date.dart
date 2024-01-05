import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '/firestore_reference.dart';

Future<Null> saveDate(BuildContext context, DateTime focusedDay) async {
  FirestoreReference firestoreReference = FirestoreReference();
  await initializeDateFormatting('ja_JP');
  String formattedDateTime = DateFormat('yyyy年MM月dd日(EEE)', 'ja_JP').format(focusedDay);

  firestoreReference.lastSelectedDay.set({
    'dateString': formattedDateTime,
    'date': focusedDay
  });
}