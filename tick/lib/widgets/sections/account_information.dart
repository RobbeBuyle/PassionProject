import 'package:flutter/material.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/style.dart';
import 'package:tick/widgets/elements/settings_rect.dart';

class AccountInformation extends StatelessWidget {
  final User user;

  AccountInformation({this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 12.0),
          child: Text(
            'Information',
            style: TitleTextStyle,
          ),
        ),
        Row(
          children: <Widget>[
            SettingsRect(
              color: ColorsBlue,
              icon: FlutterIcons.at,
            ),
            SizedBox(
              width: 12.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Email',
                  style: Body1BoldTextStyle,
                ),
                Text(
                  'user.email',
                  style: Body1LightTextStyle,
                )
              ],
            )
          ],
        ),
        Row(
          children: <Widget>[
            SettingsRect(
              color: ColorsBlue,
              icon: FlutterIcons.tabaccount,
            ),
            SizedBox(
              width: 12.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Username',
                  style: Body1BoldTextStyle,
                ),
                Text(
                  user.name,
                  style: Body1LightTextStyle,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
