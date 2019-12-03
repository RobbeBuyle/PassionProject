import 'package:flutter/material.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/style.dart';
import 'package:tick/widgets/settings_rect.dart';

class AccountInformation extends StatelessWidget {
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
                  currentUser.email,
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
                  currentUser.name,
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
