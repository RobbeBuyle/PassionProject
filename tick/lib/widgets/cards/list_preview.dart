import 'package:flutter/material.dart';
import 'package:tick/models/checklist_model.dart';
import 'package:tick/style/style.dart';

class ListPreview extends StatelessWidget {
  final CheckList checkList;

  ListPreview({this.checkList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: ColorsWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, -5.0), // changes position of shadow
          ),
        ],
      ),
      width: 160.0,
      height: 190.0,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            this.checkList.title,
            style: Title1TextStyle,
          ),
        ],
      ),
    );
  }
}
