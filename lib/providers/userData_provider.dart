import 'package:budgetApp/models/userDataModel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UserDataProvider with ChangeNotifier {
  UserDataModel _userData;
  //hive variable for the box
  final userDataBox = Hive.box("userData");

  //
  bool _isSignedUp = false;

  //constructor
  UserDataProvider() {
    loadUserData();
  }

  //getter
  UserDataModel get userData => _userData;
  bool get isSignedUp => _isSignedUp;

  //setter
  void setUserData(String name, int budget, int goal) {
    _userData =
        UserDataModel(userName: name, userBudget: budget, userGoal: goal);
    notifyListeners();
    //will save the newly created user object to the hive database
    saveUserData();
  }

  //hive stuff
  void saveUserData() {
    userDataBox.add(_userData);
    print('successfully Saved');
  }

  void loadUserData() {
    _userData = userDataBox.get(0) as UserDataModel;
    print("loaded successfully");
  }

  //closes all boxes of hive
  void closeHiveBox() {
    Hive.close();
  }
}

//
//
//
//
// void setisSignedUp(bool value) {
//   _isSignedUp = value;
//   notifyListeners();
//   // savePrefs();
// }
//

//sharedprefs stuff
// void savePrefs() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setBool("isSignedUp", _isSignedUp);
// }

// void loadPrefs() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isSignedUp = prefs.getBool("isSignedUP");
//   if (isSignedUp != null) setisSignedUp(isSignedUp);
// }
//

//
// void savePrefs() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setBool("isLoggedIn", _isLoggedIn);
// }

// void loadPrefs() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isLoggedIn = prefs.getBool("isLoggedIn");
//   if (isLoggedIn != null) setIsLoggedIn(isLoggedIn);
// }
