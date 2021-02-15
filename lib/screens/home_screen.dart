import 'package:budgetApp/constants.dart';
import 'package:budgetApp/providers/bottomNavigationBar_Provider.dart';
import 'package:budgetApp/providers/userData_provider.dart';
import 'package:budgetApp/utils/all_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'homeScreen/components/homeScreen_components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userDataProvider = Provider.of<UserDataProvider>(context);
    var bottomNavigationBarProvider =
        Provider.of<BottomNavigationBarProvider>(context);

    final tabs = [
      buildLastWeekInfo(capitalize, userDataProvider, context),
      SafeArea(
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
                    Text("${userDataProvider.userBudget.toString()} Birr",
                        style: kboldTitleStyle.copyWith(color: Colors.teal)),
                  ],
                ),
                SizedBox(height: 40.0),
                buildAddCard(
                  bgColor: Colors.yellow[800],
                  textInsideCircle: "50",
                  text: "Add 50 Birr",
                  press: () {
                    userDataProvider
                        .setUserBudget(userDataProvider.userBudget + 50);
                  },
                ),
                SizedBox(height: 10.0),
                buildAddCard(
                  bgColor: Colors.orange,
                  textInsideCircle: "100",
                  text: "Add 100 Birr",
                  press: () {},
                ),
                SizedBox(height: 10.0),
                buildAddCard(
                  bgColor: Colors.yellow[900],
                  textInsideCircle: "150",
                  text: "Add 150 Birr",
                  press: () {},
                ),
                SizedBox(height: 10.0),
                buildAddCard(
                  bgColor: Colors.teal,
                  textInsideCircle: "200",
                  text: "Add 200 Birr",
                  press: () {},
                ),
              ],
            )),
      ),
      SafeArea(child: Container(child: Text('Setting', style: kboldTitleStyle)))
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar:
            buildBottomNavigationBar(bottomNavigationBarProvider),
        backgroundColor: Colors.white,
        body: tabs[bottomNavigationBarProvider.selectedIndex],
      ),
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
}
