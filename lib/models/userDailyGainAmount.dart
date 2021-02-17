import 'package:hive/hive.dart';

part 'userDailyGainAmount.g.dart';

@HiveType(typeId: 2)
class UserDailyGainModel {
  @HiveField(0)
  DateTime date;
  @HiveField(1)
  int amount;
  UserDailyGainModel({this.date, this.amount});
}
