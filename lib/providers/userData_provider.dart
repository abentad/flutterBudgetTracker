import 'package:flutter/cupertino.dart';

class UserDataProvider with ChangeNotifier {
  String _userName;
  int _userBudget;
  int _userGoal;

  //getters
  String get userName => _userName;
  int get userBudget => _userBudget;
  int get userGoal => _userGoal;

  //setters
  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setUserBudget(int budget) {
    _userBudget = budget;
    notifyListeners();
  }

  void setUserGoal(int goal) {
    _userGoal = goal;
    notifyListeners();
  }
}
