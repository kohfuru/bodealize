import 'package:bodealize/component/clear_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CategoryInputDialog extends StatefulWidget {
  const CategoryInputDialog({super.key});

  @override
  State<CategoryInputDialog> createState() => _CategoryInputDialogState();
}

class _CategoryInputDialogState extends State<CategoryInputDialog> {
  late TextEditingController _textController;
  Color pickerColor = Color(0xff443a49);
  List<String> categories = [];

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  void onColorChanged(Color color) {
    setState(() {
      pickerColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('カテゴリを追加'),
      content: SingleChildScrollView(
        child: Column(
            children: [
              TextField(
                controller: _textController,
                autofocus: true,
                decoration: InputDecoration(
                  suffixIcon: ClearButton(controller: _textController),
                  hintText: 'カテゴリ名を入力',
                  border: const OutlineInputBorder(),
                ),
              ),
              BlockPicker(
                  pickerColor: pickerColor,
                  onColorChanged: onColorChanged,
                ),
            ],
          ),

      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: const Text('キャンセル'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () async {
                String category = _textController.text.trim();
                if (category.isNotEmpty) {
                  var db = FirebaseFirestore.instance;
                  await db.collection('categories').add({
                    'name': category
                  });
                  Navigator.pop(context);
                } else {
                  return;
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}