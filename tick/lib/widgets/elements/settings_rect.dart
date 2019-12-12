import 'package:flutter/material.dart';

class SettingsRect extends StatelessWidget {
  final IconData icon;
  final Color color;

  SettingsRect({this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
              color: this.color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16)),
          child: Icon(
            this.icon,
            size: 16.0,
            color: this.color,
          )),
    );
  }
}
