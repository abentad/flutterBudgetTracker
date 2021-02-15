import 'package:budgetApp/utils/database_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider with ChangeNotifier {
  String _userName;
  int _userBudget;
  int _userGoal;
  bool _isLoggedIn;

  UserDataProvider() {
    _isLoggedIn = false;
    // loadPrefs();
  }

  //getters
  String get userName => _userName;
  int get userBudget => _userBudget;
  int get userGoal => _userGoal;
  bool get isLoggedIn => _isLoggedIn;

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

  void setIsLoggedIn(bool value) {
    _isLoggedIn = value;
    // savePrefs();
    notifyListeners();
  }

  void checkAndStore() {
    try {
      if (_isLoggedIn == true) {
        storeToDataBase();
      }
    } catch (e) {
      print('error $e');
    }
  }

  void storeToDataBase() {
    var dbUtils = DataBaseUtility();
    dbUtils.addUserData(
      name: _userName,
      day: DateTime.now().toString(),
      amount: _userBudget,
    );
  }

  void savePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", _isLoggedIn);
  }

  void loadPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("isLoggedIn");
    if (isLoggedIn != null) setIsLoggedIn(isLoggedIn);
  }
}
