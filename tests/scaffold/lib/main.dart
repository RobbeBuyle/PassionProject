import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scaffold appbar'),
          centerTitle: true,
          backgroundColor: Colors.purple[600],
        ),
        body: Center(
          child: Text(
            'Body of the scaffold',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.grey[600],
                fontFamily: 'BebasNeue'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('+'),
          onPressed: () {
            print('pressed');
          },
        ),
      ),
    ));
