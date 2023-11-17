import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bodealize/calendar_page/calendar.dart';
import 'package:bodealize/calendar_page/input_modal.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Column(
          children: [
            CalendarWidget(),
          ],
        ),
        InputModal(),
      ],
    );
  }
}
