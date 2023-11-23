import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryInputDialog extends StatefulWidget {
  const CategoryInputDialog({super.key});

  @override
  State<CategoryInputDialog> createState() => _CategoryInputDialogState();
}

class _CategoryInputDialogState extends State<CategoryInputDialog> {
  late TextEditingController _textController;
  final bool autofocus = true;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('カテゴリを追加'),
      content: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CupertinoTextField(
          controller: _textController,
          autofocus: autofocus,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: const Text('キャンセル'),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () {

          },
        ),
      ],
    );
  }
}