import 'package:budgetApp/providers/bottomNavigationBar_Provider.dart';
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
              "${userDataProvider.userData.userBudget.toString()} Birr",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(width: 50.0, height: 1.0, color: Colors.white),
            SizedBox(height: 1.0),
            Text(
              "${userDataProvider.userData.userGoal.toString()} Birr",
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
            value: userDataProvider.userData.userBudget /
                userDataProvider.userData.userGoal,
            strokeWidth: 20.0,
            backgroundColor: Colors.grey[50].withOpacity(0.4),
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      ],
    ),
  );
}

CustomScrollView buildLastWeekInfo(String capitalize(String text),
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
        floating: false,
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
              amount: "200",
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

Widget buildAddCard(
    {String textInsideCircle, String text, Function press, Color bgColor}) {
  return InkWell(
    onTap: press,
    child: Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: bgColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Text(
                      textInsideCircle,
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

SafeArea buildAddBudgetTab(UserDataProvider userDataProvider) {
  return SafeArea(
    child: Container(
        padding: EdgeInsets.all(kdefaultPadding + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add', style: kboldTitleStyle),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Budget',
                    style: kboldTitleStyle.copyWith(fontSize: 16.0)),
                Text("${userDataProvider.userData.userBudget.toString()} Birr",
                    style: kboldTitleStyle.copyWith(color: Colors.teal)),
              ],
            ),
            SizedBox(height: 40.0),
            buildAddCard(
              bgColor: Colors.yellow[800],
              textInsideCircle: "50",
              text: "Add 50 Birr",
              press: () {
                //
                //this is where the update comes
                // userDataProvider
                //     .setUserBudget(userDataProvider.userBudget + 50);
              },
            ),
            SizedBox(height: 10.0),
            buildAddCard(
              bgColor: Colors.orange,
              textInsideCircle: "100",
              text: "Add 100 Birr",
              press: () {
                // userDataProvider
                //     .setUserBudget(userDataProvider.userBudget + 100);
              },
            ),
            SizedBox(height: 10.0),
            buildAddCard(
              bgColor: Colors.yellow[900],
              textInsideCircle: "150",
              text: "Add 150 Birr",
              press: () {
                // userDataProvider
                //     .setUserBudget(userDataProvider.userBudget + 150);
              },
            ),
            SizedBox(height: 10.0),
            buildAddCard(
              bgColor: Colors.teal,
              textInsideCircle: "200",
              text: "Add 200 Birr",
              press: () {
                // userDataProvider
                //     .setUserBudget(userDataProvider.userBudget + 200);
              },
            ),
          ],
        )),
  );
}

BottomNavigationBar buildBottomNavigationBar(
    BottomNavigationBarProvider bottomNavigationBarProvider) {
  return BottomNavigationBar(
    currentIndex: bottomNavigationBarProvider.selectedIndex,
    onTap: (tappedIndex) {
      bottomNavigationBarProvider.setSelectedIndex(tappedIndex);
    },
    selectedItemColor: Colors.teal,
    items: [
      BottomNavigationBarItem(
        label: "Home",
        icon: FaIcon(FontAwesomeIcons.home),
      ),
      BottomNavigationBarItem(
        label: "Add",
        icon: FaIcon(FontAwesomeIcons.plus),
      ),
      BottomNavigationBarItem(
        label: "Settings",
        icon: FaIcon(FontAwesomeIcons.cog),
      ),
    ],
  );
}
