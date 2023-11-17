import 'package:bodealize/calendar_page/mome_textfield.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class InputModal extends StatefulWidget {
  const InputModal({super.key});

  @override
  State<InputModal> createState() => _InputModalState();
}

class _InputModalState extends State<InputModal> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return  Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blue.shade50,
                  automaticallyImplyLeading: false,
                  title: const Text('入力'),
                  shape: const Border(
                    bottom: BorderSide(
                      color: Colors.blueGrey,
                      width: 1
                    )
                  ),
                  actions: [
                    InkWell(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close)
                      ),
                    )
                  ],
                ),
                body: const MemoTextField()
              );
            }
          );
        },
        child: const Icon(Icons.add),),
    );
  }
}
