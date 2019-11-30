import 'package:flutter/material.dart';
import 'package:tick/screens/account_screen.dart';
import 'package:tick/screens/create_screen.dart';
import 'package:tick/screens/discover_screen.dart';
import 'package:tick/screens/list_screen.dart';

class App extends StatefulWidget {
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text('lists'), icon: Icon(Icons.note)),
          BottomNavigationBarItem(
              title: Text('discover'), icon: Icon(Icons.explore)),
          BottomNavigationBarItem(
              title: Text('account'), icon: Icon(Icons.perm_identity)),
          BottomNavigationBarItem(
              title: Text('create'), icon: Icon(Icons.note_add)),
        ],
        onTap: _onBarItemTap,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onBarItemTap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
