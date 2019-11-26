import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

//stless  code complete to quickly make a stateless widget.
class Home extends StatelessWidget {
  @override //read as: 'use this build instead of the one in StatelessWidget that we extend from.'
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold app'),
        centerTitle: true,
        backgroundColor: Colors.purple[600],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        // padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
        // padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
        margin: EdgeInsets.all(10.0),
        color: Colors.grey,
        child: Text('hello'),
      ),
      // network-img: Image.network('url'),
      floatingActionButton: FloatingActionButton(
        child: Text('+'),
        onPressed: () {
          print('pressed');
        },
      ),
    );
  }
}
