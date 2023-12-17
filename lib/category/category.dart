import 'package:bodealize/auth/read_uid.dart';
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
  FirestoreReference firestoreReference = FirestoreReference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'カテゴリを選択',
        actions: [],
        backButton: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreReference.categories.snapshots(),
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
                    title: InkWell(
                      onTap: () {
                        for (var others in snapshot.data!.docs) {
                          if (others.id != document.id ) {
                            firestoreReference.categories.doc(others.id).update({'selected': false});
                          }
                        }
                        firestoreReference.categories.doc(document.id).update({'selected': true});
                        Navigator.of(context).pop();
                      },
                      highlightColor: Colors.white,
                      splashColor: Colors.transparent,
                      child: Text(
                        data['name'],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () async {
                        await firestoreReference.categories.doc(document.id).delete();
                      },
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