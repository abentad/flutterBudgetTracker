import 'package:flutter/cupertino.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _selectedIndex;

  BottomNavigationBarProvider() {
    _selectedIndex = 0;
  }

  //getters
  int get selectedIndex => _selectedIndex;

  //setters
  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
