import 'package:budgetApp/constants.dart';
import 'package:budgetApp/providers/userData_provider.dart';
import 'package:budgetApp/screens/homeScreen/home_screen.dart';
import 'package:budgetApp/screens/signUpScreen/components/signUpScreen_components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var userDataProvider = Provider.of<UserDataProvider>(context);
    var _nameController = TextEditingController();
    var _budgetController = TextEditingController();
    var _goalController = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: kboldTitleStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    myCustomTextField(
                      controller: _nameController,
                      hintText: "Name",
                    ),
                    SizedBox(height: 10.0),
                    myCustomTextField(
                      controller: _budgetController,
                      hintText: "Budget",
                    ),
                    SizedBox(height: 10.0),
                    myCustomTextField(
                      controller: _goalController,
                      hintText: "Goal",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              MaterialButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    userDataProvider.setUserName(_nameController.text);
                    userDataProvider
                        .setUserBudget(int.parse(_budgetController.text));
                    userDataProvider
                        .setUserGoal(int.parse(_goalController.text));
                    userDataProvider.setIsLoggedIn(true);
                    userDataProvider.checkAndStore();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
                minWidth: double.infinity,
                height: 50.0,
                color: Colors.teal,
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
