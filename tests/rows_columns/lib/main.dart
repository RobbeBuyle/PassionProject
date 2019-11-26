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

      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   //same alignmenttools as flexbox!
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: <Widget>[
      //     Text('Im an item'),
      //     FlatButton(
      //       child: Text('Press me'),
      //       onPressed: () {
      //         print('pressed!');
      //       },
      //       color: Colors.amber,
      //     ),
      //     Container(
      //       color: Colors.purpleAccent,
      //       padding: EdgeInsets.all(20.0),
      //       child: Text('Items in a container'),
      //     )
      //   ],
      // ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[Text('hello'), Text('world')],
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.purpleAccent,
            child: Text('one'),
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.greenAccent,
            child: Text('two'),
          ),
          Container(
            padding: EdgeInsets.all(40.0),
            color: Colors.yellowAccent,
            child: Text('three'),
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
