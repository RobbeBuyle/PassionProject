import 'package:flutter/material.dart';
import 'package:tick/models/checklist_model.dart';
import 'package:tick/style/color_style.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/text_style.dart';

class DetailScreen extends StatefulWidget {
  final CheckList checkList;

  DetailScreen({this.checkList});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  _submit() {}

  @override
  Widget build(BuildContext context) {
    print('xd');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'detail',
          style: AppBarTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => _submit(),
            icon: Icon(
              FlutterIcons.save,
              color: ColorsBlack,
            ),
          ),
        ],
        elevation: 0.0,
        backgroundColor: ColorsLightBackground,
      ),
      body: Container(),
    );
  }
}
