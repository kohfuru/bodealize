import 'package:bodealize/firestore_reference.dart';
import 'package:bodealize/modal/categoryfield_content.dart';
import 'package:flutter/material.dart';

class ModalCategoryField extends StatefulWidget {

  const ModalCategoryField({super.key});

  @override
  State<ModalCategoryField> createState() => _ModalCategoryFieldState();
}

class _ModalCategoryFieldState extends State<ModalCategoryField> {

  @override
  Widget build(BuildContext context) {
    FirestoreReference firestoreReference = FirestoreReference();

    return StreamBuilder(
      stream: firestoreReference.snapshotTrueSelected,
      builder: (context, snapshot) {
        final List<Map<String, dynamic>> filteredDocs = snapshot.data!
            .docs
            .where((doc) => doc['selected'] == true)
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        if (filteredDocs.isNotEmpty) {
          final firstDocs = filteredDocs[0];
          return CategoryFieldContent(
            categoryColor: firstDocs['color'],
            categoryName: firstDocs['name'],
          );
        } else {
          return const CategoryFieldContent(
            categoryColor: 0xFF000000,
            categoryName: 'カテゴリーを入力してください',
          );
        }
      }
    );
  }
}