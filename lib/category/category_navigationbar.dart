import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryBottom extends StatefulWidget {
  const CategoryBottom({super.key});

  @override
  State<CategoryBottom> createState() => _CategoryBottomState();

}

class _CategoryBottomState extends State<CategoryBottom> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                isPressed = true;
              });
            },
            onTapUp: (_) {
              setState(() {
                isPressed = false;
              });
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  return CupertinoAlertDialog(
                    title: const Text('カテゴリを追加'),
                    content: const CupertinoTextField(
                      placeholder: 'カテゴリ名',
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('キャンセル'),
                        onPressed: () {
                          Navigator.of(context).pop(); // ダイアログを閉じる
                        },
                      ),
                      CupertinoDialogAction(
                        child: const Text('OK'),
                        onPressed: () {
                          // OKボタンが押されたときの処理
                          Navigator.of(context).pop(); // ダイアログを閉じる
                        },
                      ),
                    ],
                  );
                },
              );
            },
            onTapCancel: () {
              setState(() {
                isPressed = false;
              });
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'カテゴリ追加',
                  style: TextStyle(
                      color: isPressed ? Colors.orange.withOpacity(0.5) : Colors.orange,
                      fontSize: 15
                  ),
                ),
              ),
            )
        )
    );
  }
}