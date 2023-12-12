import 'package:bodealize/category/category_navigationbar.dart';
import 'package:bodealize/component/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late final CollectionReference _collectionReference = firebaseFirestore.collection('categories');
  late final Stream<QuerySnapshot> _categoriesStream = _collectionReference.snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'カテゴリを選択',
        actions: [],
        backButton: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _categoriesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('問題が発生しました');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading..');
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.lens,
                      color: Color(data['color']),
                      size: 30,
                    ),
                    title: Text(
                      data['name'],
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                    thickness: 2,
                  )
                ],
              );
            }).toList(),
          );
        },
      ),
      bottomNavigationBar: const CategoryBottom(),
    );
  }
}