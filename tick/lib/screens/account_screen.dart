import 'package:flutter/material.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/style.dart';
import 'package:tick/widgets/stat_rect.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(FlutterIcons.edit),
                      iconSize: 32.0,
                      onPressed: () {
                        print('open notifications tab');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(currentUser.imageUrl),
            ),
          ),
          Text(currentUser.name.toUpperCase(), style: AccountNameStyle),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StatRect(
                  stat: 34,
                  title: 'notes',
                  color: ColorsYellow,
                ),
                StatRect(
                  stat: 112,
                  title: 'saves',
                  color: ColorsPurple,
                ),
                StatRect(
                  stat: 248,
                  title: 'checks',
                  color: ColorsBlue,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
