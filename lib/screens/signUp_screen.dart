import 'package:budgetApp/constants.dart';
import 'package:budgetApp/providers/userData_provider.dart';
import 'package:budgetApp/screens/home_screen.dart';
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
                  children: [
                    Text('Welcome', style: kboldTitleStyle),
                    SizedBox(height: 40.0),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Name",
                      ),
                      validator: (input) {
                        if (input == null) {
                          return "invalid input";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _budgetController,
                      decoration: InputDecoration(
                        hintText: "Budget",
                      ),
                      validator: (input) {
                        if (input == null) {
                          return "invalid input";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _goalController,
                      decoration: InputDecoration(
                        hintText: "Goal",
                      ),
                      validator: (input) {
                        if (input == null) {
                          return "invalid input";
                        } else {
                          return null;
                        }
                      },
                    )
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
                minWidth: double.infinity,
                height: 50.0,
                color: Colors.teal,
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
