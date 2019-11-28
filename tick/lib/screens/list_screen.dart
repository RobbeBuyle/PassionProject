import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LISTS',
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
          child: Text('Screen 2'),
          onPressed: () {
            print('nav to screen 2');
            Navigator.pushNamed(context, '/discover');
          },
        ),
      ),
    );
  }
}
