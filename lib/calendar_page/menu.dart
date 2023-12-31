import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:bodealize/firestore_reference.dart';

class MenuWidget extends StatefulWidget {
  final DateTime focusedDay;

  const MenuWidget({
    required this.focusedDay,
    super.key
  });

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  FirestoreReference firestoreReference = FirestoreReference();
  late DateTime date;
  late String dateStr;
  late String focused;
  String menuName = '';
  String memo = '';
  late bool flag;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firestoreReference.menus.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            date = data['date'].toDate();
            dateStr = DateFormat('yyyy-MM-dd').format(date);
            focused = DateFormat('yyyy-MM-dd').format(widget.focusedDay);
            DocumentReference menuDoc = firestoreReference.menus.doc(document.id);

            if (focused == dateStr) {
              menuName = data['menuName'];
              memo = data['memo'];
              flag = data['flag'];

              Color? tileColor() {
                if (flag == true) {
                  return Colors.grey;
                } else {
                  return Colors.white10;
                }
              }

              return Column(
                children: [
                  const Divider(
                    color: Colors.grey,
                    height: 0,
                  ),
                  ListTile(
                    tileColor: tileColor(),
                    // leading: IconButton(
                    //   onPressed: () {
                    //     menuDoc.delete();
                    //   },
                    //   icon: const Icon(Icons.clear),
                    // ),
                    leading: Checkbox(
                      activeColor: Colors.blue,
                      value: flag,
                      onChanged: (bool? value) {
                        menuDoc.update({'flag': value});
                      },
                    ),
                    title: Text(
                      menuName,
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(memo),
                    trailing: IconButton(
                      onPressed: () {
                        menuDoc.delete();
                      },
                      icon: const Icon(Icons.clear),
                    )
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 0,
                  )
                ],
              );
            } else {
              return Container();
            }
          }).toList().cast(),
        );
      }
    );
  }
}