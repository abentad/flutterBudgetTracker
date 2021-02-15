import 'package:budgetApp/constants.dart';
import 'package:budgetApp/providers/userData_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'homeScreen/components/homeScreen_components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userDataProvider = Provider.of<UserDataProvider>(context);

    String capitalize(String text) {
      String newText = "${text[0].toUpperCase()}${text.substring(1)}";
      return newText;
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
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
        ),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Hi, ${capitalize(userDataProvider.userName)}',
                  style: kboldTitleStyle.copyWith(color: Colors.white)),
              shadowColor: Colors.white,
              backgroundColor: Colors.teal,
              expandedHeight: 150.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
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
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2, 9),
                          blurRadius: 20.0,
                        )
                      ]),
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
        ),
      ),
    );
  }
}
