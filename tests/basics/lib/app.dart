import 'package:flutter/material.dart';
import 'hello.dart';

//convention to make app the main container

class App extends StatelessWidget {
  @override
  //anotation: label for a function that unlocks some functionality
  //build function
  Widget build(BuildContext context) {
    return MaterialApp(home: Hello());
  }
}
