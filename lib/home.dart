import 'package:flutter/material.dart';
import 'package:bodealize/calender.dart';
import 'package:bodealize/memo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  String user_name = 'ユーザー名';

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  // ignore: non_constant_identifier_names
  final event_data = {
    DateTime.utc(2023, 6, 26): ['firstEvent']
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user_name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CalendarWidget(
              focusedDay: _focusedDay,
              selectedDay: _selectedDay,
              eventData: event_data,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
            ),
            const MemoWidget(),
          ],
        ),
      ),
    );
  }
}