import 'package:flutter/material.dart';
import 'dart:math';

import 'package:tick/style/style.dart';

class HomescreenQuote extends StatelessWidget {
  final List<String> quotes = [
    'Productivity Is Key!',
    'Now Is The Time To Shine!',
    'Keep Smashing It!'
  ];
  var randomIndex = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 0),
        child: Text(
          quotes[randomIndex.nextInt(quotes.length)],
          style: QuoteTextStyle,
        ),
      ),
    );
  }
}
