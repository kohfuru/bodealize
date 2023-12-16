import 'package:bodealize/modal/categoryfield_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SelectCategory extends StatefulWidget {

  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    late final CollectionReference collectionReference = firebaseFirestore.collection('categories');
    late final myStream = collectionReference.where('selected', isEqualTo: true).snapshots();

    return StreamBuilder(
      stream: myStream,
      builder: (context, snapshot) {
        final List<Map<String, dynamic>> filteredDocs = snapshot.data!.docs.where(
                (doc) => doc['selected'] == true).map((doc) => doc.data() as Map<String, dynamic>).toList();

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