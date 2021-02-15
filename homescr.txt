import 'package:budgetApp/constants.dart';
import 'package:budgetApp/providers/userData_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Income Overview', style: kboldTitleStyle),
          toolbarHeight: 100.0,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          elevation: 0,
          bottom: buildTabBar(),
        ),
        body: TabBarView(
          children: [
            buildLastWeekContent(context),
            Container(
              padding: EdgeInsets.all(kdefaultPadding),
              child: Column(
                children: [
                  Text(
                    'Last Month',
                    style: kboldTitleStyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(kdefaultPadding),
              child: Column(
                children: [
                  Text(
                    'Last Year',
                    style: kboldTitleStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildLastWeekContent(BuildContext context) {
    var userDataProvider = Provider.of<UserDataProvider>(context);

    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: kdefaultPadding + 10, vertical: 5.0),
              child: Text(
                "Hi, ${userDataProvider.userName}",
                style: kboldTitleStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(kdefaultPadding + 10),
              child: buildInfoCard(context),
            ),
            SizedBox(height: 10.0),
            buildDayByDayInfo(
              day: "Today",
              dateTimeNow: DateTime.now(),
              label: "Daily Gain \nThrough Fam",
              amount: "200",
            ),
            Divider(color: Colors.grey),
            SizedBox(height: 20.0),
            buildDayByDayInfo(
              day: DateFormat('EEEE')
                  .format(DateTime.now().subtract(Duration(days: 1))),
              dateTimeNow: DateTime.now().subtract(Duration(days: 1)),
              label: "Daily Gain \nThrough Fam",
              amount: "100",
            ),
            Divider(color: Colors.grey),
            SizedBox(height: 20.0),
            buildDayByDayInfo(
              day: DateFormat('EEEE')
                  .format(DateTime.now().subtract(Duration(days: 2))),
              dateTimeNow: DateTime.now().subtract(Duration(days: 2)),
              label: "Daily Gain \nThrough Fam",
              amount: "50",
            ),
            Divider(color: Colors.grey),
            SizedBox(height: 20.0),
            buildDayByDayInfo(
              day: DateFormat('EEEE')
                  .format(DateTime.now().subtract(Duration(days: 3))),
              dateTimeNow: DateTime.now().subtract(Duration(days: 3)),
              label: "Daily Gain \nThrough Fam",
              amount: "50",
            ),
            Divider(color: Colors.grey),
            SizedBox(height: 20.0),
            buildDayByDayInfo(
              day: DateFormat('EEEE')
                  .format(DateTime.now().subtract(Duration(days: 4))),
              dateTimeNow: DateTime.now().subtract(Duration(days: 4)),
              label: "Daily Gain \nThrough Fam",
              amount: "50",
            ),
            Divider(color: Colors.grey),
            SizedBox(height: 20.0),
            buildDayByDayInfo(
              day: DateFormat('EEEE')
                  .format(DateTime.now().subtract(Duration(days: 5))),
              dateTimeNow: DateTime.now().subtract(Duration(days: 5)),
              label: "Daily Gain \nThrough Fam",
              amount: "50",
            ),
            Divider(color: Colors.grey),
            SizedBox(height: 20.0),
            buildDayByDayInfo(
              day: DateFormat('EEEE')
                  .format(DateTime.now().subtract(Duration(days: 6))),
              dateTimeNow: DateTime.now().subtract(Duration(days: 6)),
              label: "Daily Gain \nThrough Fam",
              amount: "50",
            )
          ],
        ),
      ),
    );
  }

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

  Container buildInfoCard(BuildContext context) {
    var userDataProvider = Provider.of<UserDataProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(10.0),
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

  TabBar buildTabBar() {
    return TabBar(
      isScrollable: true,
      labelColor: Colors.black,
      indicatorColor: Colors.white,
      labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      unselectedLabelStyle:
          TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      unselectedLabelColor: Colors.grey,
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
}
