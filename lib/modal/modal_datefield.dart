import 'dart:io';
import 'package:bodealize/modal/date_select_ios.dart';
import 'package:flutter/material.dart';

import 'datefield_content.dart';
import 'date_select_android.dart';

class DateSelect extends StatefulWidget {
  const DateSelect({super.key});

  @override
  State<DateSelect> createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  final iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: InkWell(
        onTap: () {
          if (Platform.isAndroid) {
            selectDateAndroid(context);
          } else if (Platform.isIOS) {
            selectDateIos();
          }
        },
        highlightColor: Colors.white,
        splashColor: Colors.transparent,
        child: Row(
          children: [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.calendar_today,
                color: iconColor,
              )
            ),
            const DateFieldContent(),
            const Spacer(),
            Icon(
              Icons.arrow_drop_down,
              color: iconColor,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}