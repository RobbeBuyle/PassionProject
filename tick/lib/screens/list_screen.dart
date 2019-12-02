import 'package:flutter/material.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/style.dart';
import 'package:tick/widgets/circleImage.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final String profileImage =
      "https://www.gravatar.com/avatar/853a4092fdf3d8d3ed0ebd6b16aeff9f?s=80";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLightBackground,
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'LISTS',
                style: TextStyle(fontFamily: 'Oswald', fontSize: 42.0),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(FlutterIcons.notifications),
                    iconSize: 24.0,
                  ),
                  // Image(
                  //   image: AssetImage(currentUser.imageUrl),
                  // ),
                ],
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: ColorsWhite,
        onPressed: () {
          // print('add note');
        },
      ),
    );
  }
}
