import 'package:flutter/material.dart';

import '../component/appbar.dart';
import 'modal_body.dart';

Future showModal(BuildContext context) async {
  await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) {
        return  SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Scaffold(
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
}