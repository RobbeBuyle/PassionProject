import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DISCOVER',
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
      body: Center(
        child: RaisedButton(
          child: Text('Screen 1'),
          onPressed: () {
            print('nav to screen 1');
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
    );
  }
}
