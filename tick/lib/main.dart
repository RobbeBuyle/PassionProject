import 'package:flutter/material.dart';
import 'package:tick/screens/account_screen.dart';
import 'package:tick/screens/create_screen.dart';
import 'package:tick/screens/discover_screen.dart';
import 'App.dart';
import 'screens/list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tick',
      theme: _configureThemeData(),
      home: App(),
    );
  }

  ThemeData _configureThemeData() {
    return ThemeData(
      primarySwatch: Colors.indigo,
      accentColor: Colors.red,
    );
  }
}
