import 'package:flutter/material.dart';
import 'package:bodealize/calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // キーボードが出てきても画面が崩れないようにする
      appBar: AppBar(
        title: const Text('user name'),
        shape: const Border(
          bottom: BorderSide(
            color: Colors.blueGrey,
            width: 1
          )
        ),
      ),
      body: const CalendarWidget(),
    );
  }
}