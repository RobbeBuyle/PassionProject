import 'package:flutter/material.dart';
import 'dart:math';

import 'package:tick/style/style.dart';

class HomescreenQuote extends StatefulWidget {
  @override
  _HomescreenQuoteState createState() => _HomescreenQuoteState();
}

class _HomescreenQuoteState extends State<HomescreenQuote> {
  List<String> quotes = [
    'Productivity Is Key!',
    'Now Is The Time To Shine!',
    'Keep Smashing It!'
  ];

  var randomIndex = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 14.0),
        child: Text(
          quotes[randomIndex.nextInt(quotes.length)],
          style: QuoteTextStyle,
        ),
      ),
    );
  }
}
