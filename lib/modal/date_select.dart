import 'package:flutter/material.dart';

class DateSelect extends StatefulWidget {
  const DateSelect({super.key});

  @override
  State<DateSelect> createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11,right: 11),
      child: SizedBox(
        height: 50,
        child: InkWell(
          onTap: () {},
          highlightColor: Colors.white,
          splashColor: Colors.transparent,
          child: Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              const Padding(padding: EdgeInsets.only(left: 12)),
              Text(''),
              const Spacer(),
              Icon(
                Icons.arrow_forward_outlined,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }

}