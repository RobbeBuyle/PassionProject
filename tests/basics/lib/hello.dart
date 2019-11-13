import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  @override
  //anotation: label for a function that unlocks some functionality
  //build function
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello!'),
        ),
        body: Text('This is some text. Welcome to my app!'));
  }
}
