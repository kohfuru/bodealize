import 'package:flutter/material.dart';

import '/firestore_reference.dart';

class CopyMenu {
  FirestoreReference firestoreReference = FirestoreReference();
  DateTime _date = DateTime.now();

  Future copyMenu(BuildContext context, String menuName, String memo) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050),
        initialDate: _date
    );

    if (picked != null) {
      _date = picked;

      var menuData = {
        'menuName': menuName,
        'memo': memo,
        'date': _date,
        'flag': false
      };

      firestoreReference.menus.add(menuData);
    }
  }
}