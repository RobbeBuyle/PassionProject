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
      body: Center(child: Image.asset('assets/atlanta_made.jpg')),
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
