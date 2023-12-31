import 'package:bodealize/component/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bodealize/calendar_page/calendar_page.dart';

import 'modal/modal_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = '';

  @override
  void initState() {
    super.initState();
    _lodeUserName();
  }

  Future _lodeUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.displayName != null) {
      setState(() {
        userName = user.displayName!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // キーボードが出てきても画面が崩れないようにする
      appBar: AppBarWidget(
        title: userName,
        actions: [
          IconButton(
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
            icon: Icon(Icons.add)
          )
        ],
        backButton: false,
      ),
      body: const CalendarPage(),
    );
  }
}