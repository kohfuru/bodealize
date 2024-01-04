import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'copy_menu.dart';
import '/firestore_reference.dart';

class MenuWidget extends StatefulWidget {
  final DateTime focused;

  const MenuWidget({
    required this.focused,
    super.key
  });

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  FirestoreReference firestoreReference = FirestoreReference();
  CopyMenu copyMenu = CopyMenu();
  late DateTime date;
  late String dateStr;
  late String focusedStr;
  String menuName = '';
  String memo = '';
  late bool flag;

  String dateFormat(data) => DateFormat('yyyy-MM-dd', 'ja_JP').format(data);
  
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
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            date = data['date'].toDate();
            dateStr = dateFormat(date);
            focusedStr = dateFormat(widget.focused);
            DocumentReference menuDoc = firestoreReference.menus.doc(document.id);

            if (dateStr == focusedStr) {
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => copyMenu.copyMenu(context, menuName, memo),
                          icon: const Icon(Icons.content_copy)
                        ),
                        IconButton(
                          onPressed: () {
                            menuDoc.delete();
                          },
                          icon: const Icon(Icons.delete),
                        )
                      ],
                    ),
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