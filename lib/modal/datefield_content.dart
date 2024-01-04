import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '/firestore_reference.dart';

class DateFieldContent extends StatefulWidget {
  const DateFieldContent({super.key});

  @override
  State<DateFieldContent> createState() => _DateFieldContentState();
}

class _DateFieldContentState extends State<DateFieldContent> {
  FirestoreReference firestoreReference = FirestoreReference();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreReference.selectedDay.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return Text(
                    data['dateString'],
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  );
                }).toList(),
              )
            ),
          );
        }

        return const Text(
          '日付を選択してください',
          style: TextStyle(
            fontSize: 20
          ),
        );
      }
    );
  }
}