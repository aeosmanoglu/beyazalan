import 'package:beyazalan/controllers/user_ctrl.dart';
import 'package:beyazalan/models/user.dart';
import 'package:flutter/material.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Yönetici Ekle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ID: " + args.cardID,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16),
              TextField(
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: "Adı Soyadı",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  args.name = value;
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                child: const Text("EKLE"),
                onPressed: () {
                  UserController()
                      .addNewUser(args.name, args.cardID, args.creator);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
