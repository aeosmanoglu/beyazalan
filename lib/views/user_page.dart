import 'package:beyazalan/controllers/nfc_ctrl.dart';
import 'package:beyazalan/controllers/user_ctrl.dart';
import 'package:beyazalan/models/user.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add_alt_outlined),
            onPressed: () async {
              String cardID = await NFC.getID();
              UserController().isUserAvailable(cardID)
                  ? ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Bu kart daha önce yetkilendirilmiş."),
                      ),
                    )
                  : Navigator.pushNamed(context, "/adduser",
                      arguments: User(cardID: cardID));
            },
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<User>('users').listenable(),
        builder: (context, Box<User> box, _) {
          if (box.values.isEmpty) {
            return const Center(child: Text("Listeniz boş."));
          }
          return ListView.separated(
            itemCount: box.values.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              User? user = box.getAt(index);
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                  alignment: AlignmentDirectional.centerEnd,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Icon(
                      Icons.person_remove_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) async {
                  if (args.cardID != user!.cardID) {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text("Onaylayın"),
                        content: const Text(
                          "Bu kişiyi sildiğinizde bir daha geri getiremeyeceksiniz. Emin misiniz?",
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              user.delete();
                              Navigator.of(context).pop(true);
                            },
                            child: const Text(
                              "SİL",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("İPTAL"),
                          )
                        ],
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Kendinizi silemezsiniz!")),
                    );
                    return false;
                  }
                },
                child: ListTile(
                  title: Text(user!.name),
                  subtitle: Text(user.cardID),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
