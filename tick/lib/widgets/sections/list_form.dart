import 'package:flutter/material.dart';
import 'package:tick/models/checklist_model.dart';
import 'package:tick/style/color_style.dart';
import 'package:tick/style/text_style.dart';

class ListForm extends StatefulWidget {
  @override
  _ListFormState createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  final _checkList = CheckList();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
