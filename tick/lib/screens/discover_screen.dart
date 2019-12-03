import 'package:flutter/material.dart';
import 'package:tick/style/style.dart';
import 'package:tick/widgets/trending_carousel.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLightBackground,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 60.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'DISCOVER',
                  style: TextStyle(fontFamily: 'Oswald', fontSize: 42.0),
                ),
              ],
            ),
          ),
          TrendingCarousel(),
        ],
      ),
    );
  }
}
