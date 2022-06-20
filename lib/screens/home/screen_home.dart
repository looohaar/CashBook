import 'package:cash_book/screens/home/screen_categories.dart';
import 'package:cash_book/screens/home/screen_settings.dart';
import 'package:cash_book/screens/home/screen_statistics.dart';
import 'package:cash_book/screens/home/widgets/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  final pages = [
    Statistics(),
    AddCategory(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(label: "hai", icon: Icon(Icons.abc)),
          BottomNavigationBarItem(label: "hai", icon: Icon(Icons.abc)),
          BottomNavigationBarItem(label: "hai", icon: Icon(Icons.abc)),
        ],
      ),
    );
  }
}
