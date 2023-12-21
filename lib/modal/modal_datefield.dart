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
  final iconColor = Colors.black;
  FirestoreReference firestoreReference = FirestoreReference();
  DateTime _date = DateTime.now();
  late String formattedDateTime;

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: InkWell(
        onTap: () => selectDate(context),
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
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: StreamBuilder<QuerySnapshot>(
                stream: firestoreReference.selectedDay.snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }

                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    return SizedBox(
                      width: 300,
                        child: ListView(
                          children: snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                            return Text(
                              data['date'],
                              style: const TextStyle(
                                fontSize: 20
                              ),
                            );
                          }).toList(),
                        )
                    );
                  }

                  return const Text(
                    '日付を選択してください',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  );
                }
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