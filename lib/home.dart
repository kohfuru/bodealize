import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String user_name = 'ユーザー名';
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final event_data = {
    DateTime.utc(2023, 6, 26): ['firstEvent']
  };
  List<String> _selectedEvents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user_name),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2010, 1, 1),
        lastDay: DateTime.utc(2050, 12, 31),
        focusedDay: _focusedDay,
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
        ),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // update `_focusedDay` here as well
          });
        },
        eventLoader: (date) {
          return event_data[date] ?? [];
        },
      ),
    );
  }
}