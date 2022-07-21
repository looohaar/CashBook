import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'model_class.g.dart';
@HiveType(typeId: 0)
class Category extends HiveObject{
  @HiveField(0)
  final bool transactionType;
  @HiveField(1)
  final String categoryName;
  Category( this.categoryName, this.transactionType);
  

}

@HiveType(typeId:1)
class Transactions extends HiveObject{
  @HiveField(0)
  final bool transactionType;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  final String categories;
  @HiveField(3)
  final String notes;
  @HiveField(4)
  final double amount;

  Transactions(this.amount,this.transactionType,this.date,this.categories,this.notes);
}

@HiveType(typeId:2)
class Username extends HiveObject{
  @HiveField(0)
  final String userName;
  Username(this.userName);
}