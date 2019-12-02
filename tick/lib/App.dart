import 'package:flutter/material.dart';
import 'package:tick/screens/account_screen.dart';
import 'package:tick/screens/create_screen.dart';
import 'package:tick/screens/discover_screen.dart';
import 'package:tick/screens/list_screen.dart';
import 'package:tick/widgets/bottom_navbar.dart';
import 'package:tick/style/style.dart';

class App extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(text: "lists", icon: Icons.note, color: ColorsYellow),
    BarItem(text: "discover", icon: Icons.explore, color: ColorsPurple),
    BarItem(text: "account", icon: Icons.perm_identity, color: ColorsBlue),
  ];
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [ListScreen(), DiscoverScreen(), AccountScreen(), CreateScreen()]
          .elementAt(_selectedIndex),
      bottomNavigationBar: AnimatedBottomBar(
          barItems: widget.barItems,
          animationDuration: const Duration(milliseconds: 200),
          onBarTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
