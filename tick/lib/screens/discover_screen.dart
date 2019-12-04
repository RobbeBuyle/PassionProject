import 'package:flutter/material.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/style.dart';
import 'package:tick/widgets/cards/topic_tag.dart';
import 'package:tick/widgets/sections/trending_carousel.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLightBackground,
      appBar: AppBar(
        title: Text(
          'Discover',
          style: AppBarTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FlutterIcons.search),
          ),
        ],
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 32.0,
          ),
          TopicTag(),
          SizedBox(
            height: 32.0,
          ),
          TrendingCarousel(),
        ],
      ),
    );
  }
}
