import 'package:flutter/material.dart';
import 'screens/list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tick',
      theme: _configureThemeData(),
      home: ListScreen(),
    );
  }

  ThemeData _configureThemeData() {
    return ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.amber,
    );
  }
}
