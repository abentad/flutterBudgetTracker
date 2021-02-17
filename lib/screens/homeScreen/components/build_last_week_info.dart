import 'package:budgetApp/providers/userData_provider.dart';
import 'package:budgetApp/screens/homeScreen/components/build_dayByDay_Info.dart';
import 'package:budgetApp/screens/homeScreen/components/build_info_card.dart';
import 'package:budgetApp/screens/homeScreen/components/build_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';

Widget buildLastWeekInfo(String capitalize(String text),
    UserDataProvider userDataProvider, BuildContext context) {
  return CustomScrollView(
    slivers: [
      SliverAppBar(
        title: Text(
          'Hi, ${capitalize(userDataProvider.userData.userName)}',
          style: kboldTitleStyle.copyWith(color: Colors.white),
        ),
        shadowColor: Colors.white,
        backgroundColor: Colors.teal,
        expandedHeight: 150.0,
        floating: true,
        pinned: true,
        stretch: true,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: [
            StretchMode.zoomBackground,
          ],
          background: Image(
            image: AssetImage("assets/bg2.jpg"),
            fit: BoxFit.fill,
          ),
          centerTitle: true,
        ),
        bottom: buildTabBar(),
      ),
      SliverToBoxAdapter(
        child: buildInfoCard(context),
      ),
      SliverFixedExtentList(
        itemExtent: 110.0,
        delegate: SliverChildListDelegate([
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 9),
                  blurRadius: 20.0,
                )
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: buildDayByDayInfo(
              day: "Today",
              dateTimeNow: DateTime.now(),
              label: "Daily Gain \nThrough Fam",
              amount: userDataProvider.dailybudget.toString(),
            ),
          ),
          buildDayByDayInfo(
            day: DateFormat('EEEE')
                .format(DateTime.now().subtract(Duration(days: 1))),
            dateTimeNow: DateTime.now().subtract(Duration(days: 1)),
            label: "Daily Gain \nThrough Fam",
            amount: "100",
          ),
          buildDayByDayInfo(
            day: DateFormat('EEEE')
                .format(DateTime.now().subtract(Duration(days: 2))),
            dateTimeNow: DateTime.now().subtract(Duration(days: 2)),
            label: "Daily Gain \nThrough Fam",
            amount: "50",
          ),
          buildDayByDayInfo(
            day: DateFormat('EEEE')
                .format(DateTime.now().subtract(Duration(days: 3))),
            dateTimeNow: DateTime.now().subtract(Duration(days: 3)),
            label: "Daily Gain \nThrough Fam",
            amount: "50",
          ),
          buildDayByDayInfo(
            day: DateFormat('EEEE')
                .format(DateTime.now().subtract(Duration(days: 4))),
            dateTimeNow: DateTime.now().subtract(Duration(days: 4)),
            label: "Daily Gain \nThrough Fam",
            amount: "50",
          ),
          buildDayByDayInfo(
            day: DateFormat('EEEE')
                .format(DateTime.now().subtract(Duration(days: 5))),
            dateTimeNow: DateTime.now().subtract(Duration(days: 5)),
            label: "Daily Gain \nThrough Fam",
            amount: "50",
          ),
          buildDayByDayInfo(
            day: DateFormat('EEEE')
                .format(DateTime.now().subtract(Duration(days: 6))),
            dateTimeNow: DateTime.now().subtract(Duration(days: 6)),
            label: "Daily Gain \nThrough Fam",
            amount: "50",
          ),
        ]),
      )
    ],
  );
}
