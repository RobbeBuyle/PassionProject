import 'package:flutter/material.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/text_style.dart';
import 'package:tick/style/color_style.dart';
import 'package:tick/widgets/cards/topic_tag.dart';
import 'package:tick/widgets/sections/discover_carousel.dart';

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
          backgroundColor: ColorsLightBackground),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 32.0,
          ),
          TopicTag(),
          DiscoverCarousel(),
          DiscoverCarousel(),
          DiscoverCarousel(),
        ],
      ),
    );
  }
}
