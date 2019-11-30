import 'package:flutter/material.dart';
import 'App.dart';

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
