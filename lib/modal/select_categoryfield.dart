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
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 50,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CategoryPage(),
            ),
          );
        },
        highlightColor: Colors.white,
        splashColor: Colors.transparent,
        child: Row(
          children: [
            Icon(
              Icons.category,
              color: Colors.black,
            ),
            Padding(padding: EdgeInsets.only(left: 12)),
            Text(
              'category',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}