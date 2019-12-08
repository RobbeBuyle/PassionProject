import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tick/screens/create_screen.dart';
import 'package:tick/screens/login_screen.dart';
import 'package:tick/screens/signup_screen.dart';
import 'App.dart';
import 'style/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _getScreenId() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return App();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tick',
      theme: _configureThemeData(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => _getScreenId(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/create': (context) => CreateScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        App.id: (context) => App(),
      },
    );
  }

  ThemeData _configureThemeData() {
    return ThemeData(
      primaryColor: ColorsLightBackground,
      accentColor: ColorsYellow,
      textTheme: TextTheme(title: TitleTextStyle, body1: Body1TextStyle),
    );
  }
}
