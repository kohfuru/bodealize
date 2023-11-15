import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  final DateTime _focusedDay = DateTime.now();
  final DateTime _firstDay = DateTime(2000);
  final DateTime _lastDay = DateTime(2050);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: _focusedDay,
          firstDay: _firstDay,
          lastDay: _lastDay
        )
      ],
    );
  }
}