import 'package:bodealize/firestore_reference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateSelect extends StatefulWidget {
  const DateSelect({super.key});

  @override
  State<DateSelect> createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  FirestoreReference firestoreReference = FirestoreReference();
  final iconColor = Colors.black;
  DateTime _date = DateTime.now();
  late String formattedDateTime = '日付を選択してください';

  Future<Null> _selectDate(context) async {
    await initializeDateFormatting('ja_JP');

    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      initialDate: _date
    );

    if (picked != null) {
      // setState(() {
      //   _date = picked;
      //   formattedDateTime = DateFormat('yyyy年MM月dd日（EEE）', 'ja_JP').format(_date);
      // });

      Future<bool> checkCollectionExists() async {
        final QuerySnapshot snapshot = await firestoreReference.selectedDay.get();
        return snapshot.docs.isEmpty;
      }

      bool collectionExists = await checkCollectionExists();
      _date = picked;

      if (collectionExists) {
        firestoreReference.lastSelectedDay.set({'date': _date});
      } else {
        firestoreReference.lastSelectedDay.update({'date': _date});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: InkWell(
        onTap: () => _selectDate(context),
        highlightColor: Colors.white,
        splashColor: Colors.transparent,
        child: Row(
          children: [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.calendar_today,
                color: iconColor,
              )
            ),
            const Padding(padding: EdgeInsets.only(left: 12)),
            Text(
              formattedDateTime,
              style: const TextStyle(
                fontSize: 20
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_drop_down,
              color: iconColor,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}