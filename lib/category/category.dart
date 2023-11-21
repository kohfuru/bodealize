import 'package:bodealize/category/category_body.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: const Text('カテゴリーを選択'),
        shape: const Border(
          bottom: BorderSide(
            color: Colors.blueGrey,
            width: 1
          )
        ),
      ),
      body: const CategoryBody(),
      bottomNavigationBar: Container(
        height: 85,
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          border: const Border(
            top: BorderSide(
              color: Colors.blueGrey,
              width: 1
            )
          )
        ),
        child: TextButton(
          onPressed: () {
            
          },
          child: const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'カテゴリ追加',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 15
                ),
              ),
            ),
          )
        )
      ),
    );
  }
}