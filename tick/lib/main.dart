import 'package:flutter/material.dart';
import 'package:tick/screens/create_screen.dart';
import 'App.dart';
import 'style/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tick',
      theme: _configureThemeData(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => App(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/create': (context) => CreateScreen(),
      },
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
