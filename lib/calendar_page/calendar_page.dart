import 'package:bodealize/component/calendar.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: const CalendarWidget(),
        ),
        Expanded(child: MenuWidget()),
      ],
    );
  }
}