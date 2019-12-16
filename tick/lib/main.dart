import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick/models/user_data.dart';
import 'package:tick/screens/create_screen.dart';
import 'package:tick/screens/detail_view.dart';
import 'package:tick/screens/list_screen.dart';
import 'package:tick/screens/login_screen.dart';
import 'package:tick/screens/signup_screen.dart';
import 'package:tick/style/color_style.dart';
import 'App.dart';
import 'package:tick/style/text_style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _getScreenId() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          Provider.of<UserData>(context).currentUserId = snapshot.data.uid;
          print(snapshot.data.uid);
          return App();
        } else {
          return LoginScreen();
          // print('no data');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserData(), //builder is deprecated
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tick',
        theme: _configureThemeData(),
        home: _getScreenId(),
        routes: {
          '/create': (context) => CreateScreen(),
          '/detail': (context) => DetailScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          ListScreen.id: (context) => ListScreen(),
          App.id: (context) => App(),
        },
      ),
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
