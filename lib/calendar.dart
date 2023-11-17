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
    return Stack(
      children: [
        Column(
          children: [
            TableCalendar(
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
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(30),
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () async {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return  Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.blue.shade50,
                      automaticallyImplyLeading: false,
                      title: const Text('入力'),
                      shape: const Border(
                        bottom: BorderSide(
                          color: Colors.blueGrey,
                          width: 1
                        )
                      ),
                      actions: [
                        InkWell(
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close)
                          ),
                        )
                      ],
                    ),
                  );
                }
              );
            },
            child: const Icon(Icons.add),),
        )
      ],
    );
  }
}