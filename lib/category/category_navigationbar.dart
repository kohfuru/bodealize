import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryBottom extends StatefulWidget {
  const CategoryBottom({super.key});

  @override
  State<CategoryBottom> createState() => _CategoryBottomState();

}

class _CategoryBottomState extends State<CategoryBottom> {
  bool isPressed = false;
  final bool autofocus = true;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
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
                            onPressed: () => Navigator.pop(context),
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
        )
    );
  }
}