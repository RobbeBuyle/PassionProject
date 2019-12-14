import 'package:flutter/material.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/color_style.dart';
import 'package:tick/style/text_style.dart';
import 'package:tick/widgets/elements/settings_rect.dart';

class SettingsInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 12.0),
          child: Text(
            'Settings',
            style: TitleTextStyle,
          ),
        ),
        Row(
          children: <Widget>[
            SettingsRect(
              color: ColorsPurple,
              icon: FlutterIcons.notifications,
            ),
            SizedBox(
              width: 12.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Notifications',
                  style: Body1BoldTextStyle,
                ),
                Switch(
                  value: true,
                )
              ],
            )
          ],
        ),
        Row(
          children: <Widget>[
            SettingsRect(
              color: ColorsYellow,
              icon: FlutterIcons.darkmode,
            ),
            SizedBox(
              width: 12.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Dark-mode',
                  style: Body1BoldTextStyle,
                ),
                Switch(
                  value: false,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
