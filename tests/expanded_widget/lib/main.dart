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

      body: Row(
        children: <Widget>[
          Expanded(
            child: Image.network(
                'https://images.unsplash.com/photo-1453301109223-3e2085a1e69d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80'),
            flex: 3,
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.cyan,
              child: Text('1'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.amber,
              child: Text('1'),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.purpleAccent,
              child: Text('1'),
            ),
          ),
        ],
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
