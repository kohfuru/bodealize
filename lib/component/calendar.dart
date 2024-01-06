import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

import '/modal/save_date.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  final DateTime _firstDay = DateTime(2000);
  final DateTime _lastDay = DateTime(2050);
  DateTime? _selectedDay;
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TableCalendar(
        headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true
        ),
        focusedDay: _focusedDay,
        firstDay: _firstDay,
        lastDay: _lastDay,
        selectedDayPredicate: (day) {
          return isSameDay(
              _selectedDay, day
          );
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          saveDate(_focusedDay);
        },
        calendarFormat: _calendarFormat,
      ),
    );
  }
}