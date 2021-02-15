import 'package:budgetApp/constants.dart';
import 'package:budgetApp/providers/bottomNavigationBar_Provider.dart';
import 'package:budgetApp/providers/userData_provider.dart';
import 'package:budgetApp/utils/all_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/homeScreen_components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userDataProvider = Provider.of<UserDataProvider>(context);
    var bottomNavigationBarProvider =
        Provider.of<BottomNavigationBarProvider>(context);

    final tabs = [
      buildLastWeekInfo(capitalize, userDataProvider, context),
      buildAddBudgetTab(userDataProvider),
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
}
