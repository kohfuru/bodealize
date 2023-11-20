import 'package:flutter/material.dart';
import 'package:bodealize/category/category.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
          fontSize: 20
      ),
      controller: TextEditingController(
        text: 'category',
      ),
      readOnly: true,
      decoration: InputDecoration(
          // contentPadding: padding,
        border: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CategoryPage(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_forward_ios),
        )
      )
    );
  }
}