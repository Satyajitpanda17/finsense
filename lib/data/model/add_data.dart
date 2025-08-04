import 'package:hive/hive.dart';

part 'add_data.g.dart';

@HiveType(typeId: 1)
class AddData extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String explain;

  @HiveField(2)
  final String amount;

  @HiveField(3)
  final String type;

  @HiveField(4)
  final DateTime datetime;

  AddData({
    required this.name,
    required this.explain,
    required this.amount,
    required this.type,
    required this.datetime,
  });
}
