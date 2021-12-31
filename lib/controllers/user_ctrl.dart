import 'package:beyazalan/models/user.dart';
import 'package:hive/hive.dart';

class UserController {
  final Box<User> _box = Hive.box<User>('users');

  int getBoxLength() => _box.length;

  addNewUser(String name, String cardID, String creator) {
    DateTime now = DateTime.now();
    _box.add(User(
      name: name,
      cardID: cardID,
      createDate: now,
      creator: creator,
    ));
  }

  User getUser(String cardID) =>
      _box.values.firstWhere((element) => element.cardID == cardID);

  bool isUserAvailable(String cardID) {
    List list = [];
    for (var element in _box.values) {
      list.add(element.cardID);
    }
    return list.contains(cardID);
  }
}
