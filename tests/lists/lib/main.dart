import 'package:flutter/material.dart';
import 'serie.dart';

void main() => runApp(MaterialApp(
      home: QuoteList(),
    ));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Serie> series = [
    Serie(title: 'Big Bang Theory', platform: 'Netflix'),
    Serie(title: 'Game Of Thrones', platform: 'HBO'),
    Serie(title: 'Suits', platform: 'USA'),
  ];

  Widget serieTemplate(serie) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              serie.title,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              serie.platform,
              style: TextStyle(fontSize: 15, color: Colors.grey[400]),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('My list'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: series.map((serie) => serieTemplate(serie)).toList(),
      ),
    );
  }
}
