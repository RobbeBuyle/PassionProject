import 'package:flutter/material.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/style.dart';
import 'package:tick/widgets/category_selector.dart';
import 'package:tick/widgets/lists_list.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
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
                  'LISTS',
                  style: TextStyle(fontFamily: 'Oswald', fontSize: 42.0),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(FlutterIcons.notifications),
                      iconSize: 32.0,
                      onPressed: () {
                        print('open notifications tab');
                      },
                    ),
                    SizedBox(
                      width: 42.0,
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage(currentUser.imageUrl),
                    )
                  ],
                ),
              ],
            ),
          ),
          CategorySelector(),
          ListsList(),
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
