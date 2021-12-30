/// Sunucular hakkında bilgi bu sayfada olacak.

import 'package:beyazalan/controllers/nfc_ctrl.dart';
import 'package:beyazalan/controllers/user_ctrl.dart';
import 'package:beyazalan/models/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Beyaz Alan'),
          actions: [
            IconButton(
              icon: const Icon(Icons.verified_outlined),
              onPressed: () async {
                String cardID = await NFC.getID();
                UserController().getBoxLength() > 0
                    ? Navigator.pushNamed(context, "/user",
                        arguments: UserController().getUser(cardID))
                    : Navigator.pushNamed(context, "/adduser",
                        arguments: User(cardID: cardID));
              },
            ),
          ],
        ),
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.qr_code),
        ),
      );
}
