import 'package:flutter/material.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/services/auth_service.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/style.dart';
import 'package:tick/widgets/sections/account_information.dart';
import 'package:tick/widgets/sections/settings_information.dart';
import 'package:tick/widgets/elements/stat_rect.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLightBackground,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(FlutterIcons.edit),
          ),
        ],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
            ),
            Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: new ClipRRect(
                      borderRadius: BorderRadius.circular(26.0),
                      child: Image.asset(
                        currentUser.imageUrl,
                        height: 92.0,
                        width: 92.0,
                      ),
                    )),
                Text(currentUser.name, style: AccountNameStyle),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 36.0, 0, 0),
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
            ),
            SizedBox(
              height: 36.0,
            ),
            AccountInformation(),
            SizedBox(
              height: 36.0,
            ),
            SettingsInformation(),
            SizedBox(
              height: 40.0,
            ),
            FlatButton(
              child: Text('Log Out'),
              onPressed: () => AuthService.logout(context),
            )
          ],
        ),
      ),
    );
  }
}
