import 'package:flutter/material.dart';

import '../component/calendar.dart';
import '../component/appbar.dart';

Future showDateSelectModal(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    builder: (context) {
      return  SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Scaffold(
          appBar: AppBarWidget(
            leading: const SizedBox(),
            title: '日付選択',
            actions: [
              InkWell(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    '閉じる',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18
                    ),
                  ),
                ),
              )
            ],
            backButton: false,
          ),
          body: const CalendarWidget()
        )
      );
    }
  );
}