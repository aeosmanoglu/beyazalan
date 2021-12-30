import 'package:beyazalan/models/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  static initHive() async {
    await Hive.initFlutter();
  }

  static registerAdapters() {
    Hive.registerAdapter(UserAdapter());
  }

  static openBoxes() async {
    await Hive.openBox<User>('users');
  }
}
