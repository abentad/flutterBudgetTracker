import 'package:budgetApp/models/userDailyGainAmount.dart';
import 'package:budgetApp/models/userDataModel.dart';
import 'package:budgetApp/providers/bottomNavigationBar_Provider.dart';
import 'package:budgetApp/providers/userData_provider.dart';
import 'package:budgetApp/screens/homeScreen/home_screen.dart';
import 'package:budgetApp/screens/signUpScreen/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shared_preferences/shared_preferences.dart';

//
int initScreen;
const String userDataBoxName = "userData";
const String userDailyGainBoxName = "userDailyGain";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initializing hive at app document directory
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  //this will use the UserDataModelAdapter that we generated
  Hive.registerAdapter(UserDataModelAdapter());
  Hive.registerAdapter(UserDailyGainModelAdapter());

  //for opening the signUpform only one time
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen $initScreen');
  //
  //this will open the userData hive box
  await Hive.openBox<UserDataModel>(userDataBoxName);
  await Hive.openBox<UserDailyGainModel>(userDailyGainBoxName);

  //
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => UserDataProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => BottomNavigationBarProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BudgetApp',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
          initScreen == 0 || initScreen == null ? SignUpScreen() : HomeScreen(),
    );
  }
}
