import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CREATE',
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
