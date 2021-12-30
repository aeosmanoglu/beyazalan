import 'package:beyazalan/controllers/boxes_ctrl.dart';
import 'package:beyazalan/models/brand_colors.dart';
import 'package:beyazalan/views/add_user_page.dart';
import 'package:beyazalan/views/home_page.dart';
import 'package:beyazalan/views/user_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Boxes.initHive();
  Boxes.registerAdapters();
  await Boxes.openBoxes();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.light().copyWith(
            primary: BrandColors().primarySwatch,
            secondary: BrandColors().primarySwatch.shade400,
            onSecondary: Colors.white,
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark().copyWith(
            secondary: BrandColors().secondarySwatch,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/user': (context) => const UserPage(),
          '/adduser': (context) => const AddUserPage(),
        },
      );
}
