import 'dart:io';

import 'package:budgetApp/models/user_data_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseUtility {
  Database db;

  init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print('this is path: ${documentsDirectory.path}');
    final path = documentsDirectory.path + "/userData.db";
    //this will open a database if it already exists or creates a new db if it doesnt
    //and if it doesnt it will also create a table with primary key of name also non primary columns day and amount
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        try {
          newDb.execute("""
        CREATE TABLE UserData
        (
          name TEXT PRIMARY KEY,
          day TEXT,
          amount INTEGER,
        )
        """);
        } catch (e) {
          print("error while on create: $e");
        }
      },
    );
  }

  fetchUserData(String name) async {
    final maps = await db.query(
      "UserData",
      columns: null,
      where: "name = ?",
      whereArgs: [name],
    );

    if (maps.length > 0) {
      return UserDataModel.fromDb(maps.first);
    }
    return null;
  }

  addUserData({String name, String day, int amount}) {
    init();
    db.insert(
      "UserData",
      {
        "name": name,
        "day": day,
        "amount": amount,
      },
    );
  }
}
