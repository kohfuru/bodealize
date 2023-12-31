import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'component/appbar.dart';
import 'modal/modal.dart';
import 'calendar_page/calendar_page.dart';

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
            onPressed: () => showModal(context),
            icon: const Icon(Icons.add)
          )
        ],
        backButton: false,
      ),
      body: const CalendarPage(),
    );
  }
}