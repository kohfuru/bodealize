import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
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
      },
      calendarFormat: _calendarFormat,
    );
  }
}