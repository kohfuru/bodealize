import 'package:bodealize/component/appbar.dart';
import 'package:bodealize/modal/modal_body.dart';
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
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              enableDrag: true,
              builder: (context) {
                return  SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Scaffold(
                    // resizeToAvoidBottomInset: true,
                    appBar: AppBarWidget(
                      title: '入力',
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
                      backButton: false,
                    ),
                    body: SizedBox.expand(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: const ModalBody(),
                      ),
                    )
                  )
                );
              }
            );
          },
          child: const Icon(Icons.add),
        ),
      )
    );
  }
}