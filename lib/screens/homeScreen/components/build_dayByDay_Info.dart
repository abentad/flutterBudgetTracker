import 'package:budgetApp/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Container buildDayByDayInfo(
    {String day, DateTime dateTimeNow, String label, String amount}) {
  return Container(
    padding: EdgeInsets.all(kdefaultPadding + 10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              day,
              style: kboldTitleStyle,
            ),
            Text(
              DateFormat('E  MMMM d, y').format(dateTimeNow),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.teal,
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '$amount Birr',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
