import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tick/screens/create_screen.dart';
import 'package:tick/screens/list_screen.dart';
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
          print(snapshot.data.uid);
          return App(
            userId: snapshot.data.uid,
          );
        } else {
          return LoginScreen();
          // print('no data');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tick',
      theme: _configureThemeData(),
      home: _getScreenId(),
      routes: {
        '/create': (context) => CreateScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        ListScreen.id: (context) => ListScreen(),
        App.id: (context) => App(),
      },
    );
  }

  ThemeData _configureThemeData() {
    return ThemeData(
      primaryColor: ColorsGrey300,
      accentColor: ColorsYellow,
      textTheme: TextTheme(title: TitleTextStyle, body1: Body1TextStyle),
    );
  }
}
