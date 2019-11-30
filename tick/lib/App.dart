import 'package:flutter/material.dart';
import 'package:tick/screens/account_screen.dart';
import 'package:tick/screens/create_screen.dart';
import 'package:tick/screens/discover_screen.dart';
import 'package:tick/screens/list_screen.dart';
import 'package:tick/widgets/bottomNavBar.dart';

class App extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(text: "lists", icon: Icons.note, color: Colors.amber),
    BarItem(text: "discover", icon: Icons.explore, color: Colors.purple),
    BarItem(text: "account", icon: Icons.perm_identity, color: Colors.teal),
    BarItem(text: "create", icon: Icons.note, color: Colors.pink),
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

      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(title: Text('lists'), icon: Icon(Icons.note)),
      //     BottomNavigationBarItem(
      //         title: Text('discover'), icon: Icon(Icons.explore)),
      //     BottomNavigationBarItem(
      //         title: Text('account'), icon: Icon(Icons.perm_identity)),
      //     BottomNavigationBarItem(
      //         title: Text('create'), icon: Icon(Icons.note_add)),
      //   ],
      //   onTap: _onBarItemTap,
      //   currentIndex: _selectedIndex,
      //   type: BottomNavigationBarType.fixed,
      // ),
    );
  }

  // void _onBarItemTap(int value) {
  //   setState(() {
  //     _selectedIndex = value;
  //   });
  // }
}
