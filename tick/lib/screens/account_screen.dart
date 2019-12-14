import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/screens/edit_profile_screen.dart';
import 'package:tick/services/auth_service.dart';
import 'package:tick/style/color_style.dart';
import 'package:tick/style/text_style.dart';
import 'package:tick/utilities/constants.dart';
import 'package:tick/widgets/sections/account_information.dart';
import 'package:tick/widgets/sections/settings_information.dart';
import 'package:tick/widgets/elements/stat_rect.dart';

class AccountScreen extends StatefulWidget {
  final String userId;

  AccountScreen({this.userId});

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLightBackground,
      appBar: AppBar(
        backgroundColor: ColorsLightBackground,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: FutureBuilder(
          future: usersRef.document(widget.userId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // print(snapshot.data['name']);

            User user = User.fromDoc(snapshot.data);
            // print(user.name);

            return ListView(
              children: <Widget>[
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Container(
                        width: 122.0,
                        height: 122.0,
                        child: CircleAvatar(
                          backgroundColor: ColorsGrey300,
                          backgroundImage: user.imageUrl.isEmpty
                              ? AssetImage('assets/images/user_placeholder.jpg')
                              : CachedNetworkImageProvider(user.imageUrl),
                        ),
                      ),
                    ),
                    Text(user.name, style: AccountNameStyle),
                    SizedBox(
                      height: 8.0,
                    ),
                    FlatButton(
                      color: Colors.transparent,
                      child: Text(
                        'Edit profile',
                        style: TextStyle(color: ColorsGrey300),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EditProfileScreen(
                                    user: user,
                                  ))),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      StatRect(
                        stat: user.statsNotes,
                        title: 'notes',
                        color: ColorsYellow,
                      ),
                      StatRect(
                        stat: user.statsSaves,
                        title: 'saves',
                        color: ColorsPurple,
                      ),
                      StatRect(
                        stat: user.statsChecks,
                        title: 'checks',
                        color: ColorsBlue,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 36.0,
                ),
                AccountInformation(user: user),
                SizedBox(
                  height: 36.0,
                ),
                SettingsInformation(),
                SizedBox(
                  height: 40.0,
                ),
                FlatButton(
                  child: Text('Log Out'),
                  onPressed: () => AuthService.logout(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
