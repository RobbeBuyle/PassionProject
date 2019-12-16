import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/screens/account_screen.dart';
import 'package:tick/screens/create_screen.dart';
import 'package:tick/screens/discover_screen.dart';
import 'package:tick/screens/list_screen.dart';
import 'package:tick/style/color_style.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/widgets/elements/bottom_navbar.dart';

import 'models/user_data.dart';

class App extends StatefulWidget {
  static final String id = 'app_screen';

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
    final String currentUserId = Provider.of<UserData>(context).currentUserId;
    return Container(
      color: ColorsLightBackground,
      child: SafeArea(
        child: Scaffold(
          body: [
            ListScreen(
              currentUserId: currentUserId,
            ),
            DiscoverScreen(),
            AccountScreen(
              userId: currentUserId,
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
