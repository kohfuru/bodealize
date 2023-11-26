import 'package:bodealize/component/appbar.dart';
import 'package:flutter/material.dart';
import 'package:bodealize/calendar_page/calendar_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false, // キーボードが出てきても画面が崩れないようにする
      appBar: AppBarWidget(
        title: 'ユーザー名',
        actions: [],
      ),
      body: CalendarPage(),
    );
  }
}