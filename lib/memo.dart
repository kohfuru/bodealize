import 'package:flutter/material.dart';

class MemoWidget extends StatefulWidget {
  const MemoWidget({super.key});

  @override
  State<MemoWidget> createState() => _MemoWidgetState();
}

class _MemoWidgetState extends State<MemoWidget> {
  var memo = <String>[];
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 300,
                margin: const EdgeInsets.only(left: 10),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      )
                    ),
                    hintText: 'Enter a search term',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),
                  ),
                  controller: myController,
                ),
              ),
              Container(
                width: 100,
                margin: const EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      memo.add(myController.text);
                    });
                  },
                  child: const Text('button'),
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: memo.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    memo[index]
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}