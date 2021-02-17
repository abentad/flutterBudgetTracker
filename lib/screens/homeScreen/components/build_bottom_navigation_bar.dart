import 'package:budgetApp/providers/bottomNavigationBar_Provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

BottomNavigationBar buildBottomNavigationBar(
    BottomNavigationBarProvider bottomNavigationBarProvider) {
  return BottomNavigationBar(
    currentIndex: bottomNavigationBarProvider.selectedIndex,
    onTap: (tappedIndex) {
      bottomNavigationBarProvider.setSelectedIndex(tappedIndex);
    },
    selectedItemColor: Colors.teal,
    unselectedItemColor: Colors.black,
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
        label: "Subtract",
        icon: FaIcon(FontAwesomeIcons.minus),
      ),
      BottomNavigationBarItem(
        label: "Settings",
        icon: FaIcon(FontAwesomeIcons.cog),
      ),
    ],
  );
}
