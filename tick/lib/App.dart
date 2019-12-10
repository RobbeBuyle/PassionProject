import 'package:flutter/material.dart';
import 'package:tick/screens/account_screen.dart';
import 'package:tick/screens/create_screen.dart';
import 'package:tick/screens/discover_screen.dart';
import 'package:tick/screens/list_screen.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/widgets/elements/bottom_navbar.dart';
import 'package:tick/style/style.dart';

class App extends StatefulWidget {
  static final String id = 'app_screen';
  final String userId;

  App({this.userId});

  final List<BarItem> barItems = [
    BarItem(text: "lists", icon: FlutterIcons.tabnotes, color: ColorsYellow),
    BarItem(
        text: "discover", icon: FlutterIcons.tabdiscover, color: ColorsPurple),
    BarItem(text: "account", icon: FlutterIcons.tabaccount, color: ColorsBlue),
  ];
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsLightBackground,
      child: SafeArea(
        child: Scaffold(
          body: [
            ListScreen(),
            DiscoverScreen(),
            AccountScreen(
              userId: widget.userId,
            ),
            CreateScreen()
          ].elementAt(_selectedIndex),
          bottomNavigationBar: AnimatedBottomBar(
              barItems: widget.barItems,
              animationDuration: const Duration(milliseconds: 200),
              onBarTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}
