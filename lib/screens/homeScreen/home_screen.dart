import 'package:budgetApp/constants.dart';
import 'package:budgetApp/providers/bottomNavigationBar_Provider.dart';
import 'package:budgetApp/providers/userData_provider.dart';
import 'package:budgetApp/screens/homeScreen/components/build_add_budget_tab.dart';
import 'package:budgetApp/screens/homeScreen/components/build_bottom_navigation_bar.dart';
import 'package:budgetApp/screens/homeScreen/components/build_last_week_info.dart';
import 'package:budgetApp/screens/homeScreen/components/build_subtract_budget_tab.dart';
import 'package:budgetApp/utils/all_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //providers used
    var userDataProvider = Provider.of<UserDataProvider>(context);
    var bottomNavigationBarProvider =
        Provider.of<BottomNavigationBarProvider>(context);

    //tab list for bottom navigation bar
    final tabs = [
      //home tab
      buildLastWeekInfo(capitalize, userDataProvider, context),
      //add tab
      buildAddBudgetTab(userDataProvider),
      //
      buildSubtractBudgetTab(userDataProvider),
      //setting tab
      SafeArea(
        child: Container(
          child: Text('Setting', style: kboldTitleStyle),
        ),
      )
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
}
