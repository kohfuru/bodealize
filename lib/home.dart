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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
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
          Row(
            children: [
              Container(
                width: 325,
                margin: const EdgeInsets.only(left: 10),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),
                  ),
                ),
              ),
              Container(
                // width: 100,
                margin: const EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('button'),
                ),
              )
            ]
          ),
        ],
      )
    );
  }
}