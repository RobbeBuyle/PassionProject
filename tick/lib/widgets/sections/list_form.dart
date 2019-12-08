import 'package:flutter/material.dart';
import 'package:tick/models/checklist_model.dart';

class ListForm extends StatefulWidget {
  @override
  _ListFormState createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  final _checkList = CheckList();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Builder(
            builder: (context) => Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(),
                  TextFormField(),
                  TextFormField(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
