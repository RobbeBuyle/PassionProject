import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ACCOUNT',
          style: TextStyle(
              fontSize: 42.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oswald'),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            iconSize: 24.0,
          )
        ],
      ),
    );
  }
}
