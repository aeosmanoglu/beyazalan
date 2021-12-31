import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  final String cardID;
  @HiveField(2)
  final DateTime? createDate;
  @HiveField(3)
  final String creator;

  User({
    this.name = "İsimsiz",
    required this.cardID,
    this.creator = "God",
    this.createDate,
  });
}
