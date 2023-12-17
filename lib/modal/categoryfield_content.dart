import 'package:flutter/material.dart';

import '../category/category.dart';

class CategoryFieldContent extends StatefulWidget {
  final int categoryColor;
  final String categoryName;

  const CategoryFieldContent({
    required this.categoryColor,
    required this.categoryName,
    super.key
  });

  @override
  State<CategoryFieldContent> createState() => _CategoryFieldContentState();
}

class _CategoryFieldContentState extends State<CategoryFieldContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: SizedBox(
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
                Icons.lens,
                color: Color(widget.categoryColor),
              ),
              const Padding(padding: EdgeInsets.only(left: 12)),
              Text(
                widget.categoryName,
                style: const TextStyle(
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
      ),
    );
  }
}