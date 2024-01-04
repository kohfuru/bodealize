import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/calendar_page/menu.dart';
import '/firestore_reference.dart';

class FetchSelectedDay extends StatefulWidget {
  const FetchSelectedDay({super.key});

  @override
  State<FetchSelectedDay> createState() => _FetchSelectedDayState();
}

class _FetchSelectedDayState extends State<FetchSelectedDay> {
  FirestoreReference firestoreReference = FirestoreReference();

  late DateTime focused;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firestoreReference.selectedDay.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            focused = data['date'].toDate();
            return MenuWidget(focused: focused);
          })
          .toList()
          .cast(),
        );
      }
    );
  }
}