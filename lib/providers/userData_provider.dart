import 'package:budgetApp/models/userDailyGainAmount.dart';
import 'package:budgetApp/models/userDataModel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UserDataProvider with ChangeNotifier {
  UserDataModel _userData;
  UserDailyGainModel _userDailyGain;

  int dailybudget = 0;

  //hive variable for the box
  final userDataBox = Hive.box<UserDataModel>("userData");
  final userDailyGainBox = Hive.box<UserDailyGainModel>('userDailyGain');

  //
  bool _isSignedUp = false;

  //constructor
  UserDataProvider() {
    loadUserData();
    loadDailyBudget();
  }

  //getter
  UserDataModel get userData => _userData;
  bool get isSignedUp => _isSignedUp;
  UserDailyGainModel get userDailyGain => _userDailyGain;

  //setter
  void setUserData(String name, int budget, int goal) {
    _userData =
        UserDataModel(userName: name, userBudget: budget, userGoal: goal);
    notifyListeners();
    //will save the newly created user object to the hive database
    saveUserData();
  }

  void setDailyGainData(DateTime date, int amount) {
    _userDailyGain = UserDailyGainModel(date: date, amount: amount);
    saveDailyBudget();
    notifyListeners();
  }

  //updater
  void addToUserBudget(int amount) {
    _userData.userBudget = amount + _userData.userBudget;
    dailybudget = dailybudget + amount;
    notifyListeners();
    updateUserBudgetDataOnDataBase(amount);
  }

  void subtractFromUserBudget(int amount) {
    _userData.userBudget = _userData.userBudget - amount;
    dailybudget = dailybudget - amount;
    notifyListeners();
    updateUserBudgetDataOnDataBase(amount);
  }

  //hive stuff
  void saveUserData() {
    userDataBox.add(_userData);
    print('successfully Saved');
  }

  void loadUserData() {
    _userData = userDataBox.get(0);
    print("loaded successfully");
  }

  void saveDailyBudget() {
    //this is todays data and becomes yesterdays on the next day and it is at index 0
    userDailyGainBox.add(_userDailyGain);

    print('saved daily gain data');
  }

  void loadDailyBudget() {
    _userDailyGain = userDailyGainBox.get(0);
    print('loaded daily gain data');
  }

  void updateUserBudgetDataOnDataBase(int amount) {
    userDataBox.put(
      0,
      UserDataModel(
        userName: _userData.userName,
        userBudget: amount,
        userGoal: _userData.userGoal,
      ),
    );
  }

  //closes all boxes of hive
  void closeHiveBox() {
    Hive.close();
  }

  //hive stuff ends

  void checkDate() {
    //this also handles overflow into the next month
    var nextCheck = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
    //store nextCheck somewhere
    if (DateTime.now().isAfter(nextCheck)) {
      //do the thing
      saveDailyBudget();
    }
  }
}
