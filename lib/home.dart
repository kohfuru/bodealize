import 'package:bodealize/pfc/pfc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'component/sign_out.dart';
import 'firestore_reference.dart';
import 'component/appbar.dart';
import 'modal/input_modal.dart';
import 'calendar_page/calendar_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirestoreReference firestoreReference = FirestoreReference();
  String userName = '';
  int selectedIndex = 0;

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

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget getBody(int index) {
    if (index == 0) {
      return const CalendarPage();
    } else if (index == 1) {
      return const PfcPage();
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // キーボードが出てきても画面が崩れないようにする
      appBar: AppBarWidget(
        leading: IconButton(
          onPressed: () => signOutDialog(context),
          icon: const Icon(Icons.logout),
        ),
        title: userName,
        actions: [
          IconButton(
            onPressed: () => showInputModal(context),
            icon: const Icon(Icons.add)
          )
        ],
        backButton: false,
      ),
      body: getBody(selectedIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide())
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.description),
                label: 'PFC'
            ),
          ],
          onTap: onTapped,
        ),
      ),
    );
  }
}