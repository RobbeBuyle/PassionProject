import 'package:mobx_test/store/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CounterPage extends StatelessWidget {
  final Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App with Mobx')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Presses:'),
            Observer(builder: (_) => Text('${counter.count}')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('add'),
                  onPressed: counter.increment,
                ),
                FlatButton.icon(
                  icon: Icon(Icons.remove),
                  label: Text('remove'),
                  onPressed: counter.decrement,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
