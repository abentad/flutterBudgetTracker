import 'package:budgetApp/providers/bottomNavigationBar_Provider.dart';
import 'package:budgetApp/providers/userData_provider.dart';
import 'package:budgetApp/screens/homeScreen/home_screen.dart';
import 'package:budgetApp/screens/signUpScreen/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
    var userDataProvider = Provider.of<UserDataProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BudgetApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
          userDataProvider.isLoggedIn == false ? SignUpScreen() : HomeScreen(),
    );
  }
}
