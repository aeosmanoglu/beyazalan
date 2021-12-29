import 'package:beyazalan/controllers/nfc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Beyaz Alan'),
          actions: [
            IconButton(
                icon: const Icon(Icons.manage_accounts_outlined),
                onPressed: () {
                  NFC.reader();
                }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              'Bilgi almak istediğiniz cihazın QR kodunu okutun.',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Colors.grey,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            null;
          },
          child: const Icon(Icons.qr_code),
        ),
      );
}
