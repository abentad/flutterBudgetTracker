class UserDataModel {
  String name;
  String day;
  int amount;
  UserDataModel({this.name, this.amount, this.day});

  UserDataModel.fromDb(Map<String, dynamic> parsedJson)
      : name = parsedJson['name'],
        day = parsedJson['day'],
        amount = parsedJson['amount'];
}
