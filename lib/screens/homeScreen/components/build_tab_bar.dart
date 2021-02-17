import 'package:flutter/material.dart';

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
