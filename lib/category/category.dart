import 'package:bodealize/category/category_body.dart';
import 'package:bodealize/category/category_navigationbar.dart';
import 'package:bodealize/component/appbar.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: 'カテゴリーを選択',
        actions: [],
      ),
      body: CategoryBody(),
      bottomNavigationBar: CategoryBottom(),
    );
  }
}