import 'package:flutter/material.dart';
import 'pages/counter_page.dart';

void main() => runApp(MobxApp());

class MobxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}
