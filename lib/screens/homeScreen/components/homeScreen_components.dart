import 'package:budgetApp/providers/userData_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

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

TabBar buildTabBar() {
  return TabBar(
    isScrollable: true,
    labelColor: Colors.white,
    indicatorColor: Colors.teal,
    labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    unselectedLabelStyle:
        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
    unselectedLabelColor: Colors.grey[50].withOpacity(0.4),
    labelPadding: EdgeInsets.only(right: 48.0),
    tabs: [
      Tab(
        text: "Last Week",
      ),
      Tab(
        text: "Last Month",
      ),
      Tab(
        text: "Last Year",
      )
    ],
  );
}

Container buildInfoCard(BuildContext context) {
  var userDataProvider = Provider.of<UserDataProvider>(context);

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    height: 150,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(2, 9),
          blurRadius: 20.0,
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${userDataProvider.userBudget.toString()} Birr",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(width: 50.0, height: 1.0, color: Colors.white),
            SizedBox(height: 1.0),
            Text(
              "${userDataProvider.userGoal.toString()} Birr",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(
                  Icons.add,
                  size: 10.0,
                  color: Colors.greenAccent,
                ),
                SizedBox(width: 3.0),
                Text(
                  '200 Birr',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.minus,
                  size: 10.0,
                  color: Colors.red,
                ),
                SizedBox(width: 3.0),
                Text(
                  '100 Birr',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        //right here
        Container(
          height: 90.0,
          width: 90.0,
          child: CircularProgressIndicator(
            value: userDataProvider.userBudget / userDataProvider.userGoal,
            strokeWidth: 20.0,
            backgroundColor: Colors.grey[50].withOpacity(0.4),
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      ],
    ),
  );
}
