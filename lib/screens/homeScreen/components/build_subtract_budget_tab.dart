import 'package:budgetApp/providers/userData_provider.dart';
import 'package:budgetApp/screens/homeScreen/components/build_add_card.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

SafeArea buildSubtractBudgetTab(UserDataProvider userDataProvider) {
  return SafeArea(
    child: Container(
        padding: EdgeInsets.all(kdefaultPadding + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subtract', style: kboldTitleStyle),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Budget',
                    style: kboldTitleStyle.copyWith(fontSize: 16.0)),
                Text("${userDataProvider.userData.userBudget.toString()} Birr",
                    style: kboldTitleStyle.copyWith(color: Colors.teal)),
              ],
            ),
            SizedBox(height: 40.0),
            buildAddCard(
              bgColor: Colors.yellow[800],
              textInsideCircle: "50",
              text: "subtract 50 Birr",
              press: () {
                //
                //this is where the update comes
                userDataProvider.subtractFromUserBudget(50);
              },
            ),
            SizedBox(height: 10.0),
            buildAddCard(
              bgColor: Colors.orange,
              textInsideCircle: "100",
              text: "subtract 100 Birr",
              press: () {
                userDataProvider.subtractFromUserBudget(100);
              },
            ),
            SizedBox(height: 10.0),
            buildAddCard(
              bgColor: Colors.yellow[900],
              textInsideCircle: "150",
              text: "subtract 150 Birr",
              press: () {
                userDataProvider.subtractFromUserBudget(150);
              },
            ),
            SizedBox(height: 10.0),
            buildAddCard(
              bgColor: Colors.teal,
              textInsideCircle: "200",
              text: "subtract 200 Birr",
              press: () {
                userDataProvider.subtractFromUserBudget(200);
              },
            ),
          ],
        )),
  );
}
