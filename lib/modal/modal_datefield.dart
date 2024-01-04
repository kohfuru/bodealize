import 'package:flutter/material.dart';

import 'date_select_modal.dart';
import 'datefield_content.dart';

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
          showDateSelectModal(context);
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