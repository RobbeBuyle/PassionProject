import 'package:flutter/material.dart';

class StatRect extends StatelessWidget {
  final String title;
  final int stat;
  final Color color;

  StatRect({this.title, this.stat, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          width: 82.0,
          height: 82.0,
          decoration: BoxDecoration(
              color: this.color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(22)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  this.stat.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: this.color,
                      fontSize: 26.0),
                ),
                Text(
                  this.title,
                  style: TextStyle(fontSize: 14.0, color: this.color),
                )
              ],
            ),
          )),
    );
  }
}
