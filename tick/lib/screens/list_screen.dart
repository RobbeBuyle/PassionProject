import 'package:flutter/material.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/style.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsLightBackground,
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
            icon: Icon(FlutterIcons.notifications),
            iconSize: 24.0,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: ColorsYellow,
        onPressed: () {
          print('add note');
        },
      ),
    );
  }
}
