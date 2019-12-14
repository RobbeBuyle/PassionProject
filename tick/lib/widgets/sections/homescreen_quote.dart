import 'package:flutter/material.dart';
import 'dart:math';

import 'package:tick/style/text_style.dart';

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
        padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
        child: Text(
          quotes[randomIndex.nextInt(quotes.length)],
          style: QuoteTextStyle,
        ),
      ),
    );
  }
}
