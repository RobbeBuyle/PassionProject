import 'package:flutter/material.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/color_style.dart';
import 'package:tick/style/text_style.dart';
import 'package:tick/widgets/sections/list_form.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'new list',
          style: AppBarTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FlutterIcons.save,
              color: ColorsBlack,
            ),
          ),
        ],
        elevation: 0.0,
        backgroundColor: ColorsLightBackground,
      ),
      body: ListForm(),
    );
  }
}
