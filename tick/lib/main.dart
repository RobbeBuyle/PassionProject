import 'package:flutter/material.dart';
import 'App.dart';
import 'style/style.dart';

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
      primaryColor: ColorsLightBackground,
      accentColor: ColorsYellow,
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(title: AppBarTextStyle),
      ),
      textTheme: TextTheme(title: TitleTextStyle, body1: Body1TextStyle),
    );
  }
}
