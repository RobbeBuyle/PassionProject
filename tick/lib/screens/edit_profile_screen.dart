import 'package:flutter/material.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/services/database_services.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/style.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  EditProfileScreen({this.user});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      String _profileImageUrl = '';
      User user = User(
        id: widget.user.id,
        name: _name,
        imageUrl: _profileImageUrl,
      );
      //update database
      DatabaseService.updateUser(user);
      Navigator.pop(context);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'edit profile',
            style: AppBarTextStyle,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FlutterIcons.save,
                color: ColorsBlack,
              ),
              onPressed: _submit,
            ),
          ],
          elevation: 0.0,
          backgroundColor: ColorsLightBackground),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 14.0),
                    child: new ClipRRect(
                      borderRadius: BorderRadius.circular(26.0),
                      child: Image.asset(
                        currentUser.imageUrl,
                        height: 92.0,
                        width: 92.0,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () => print('change img'),
                    child: Text(
                      'Change profile image',
                      style: secondaryButtonTextStyle,
                    ),
                    splashColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    initialValue: _name,
                    style: TextStyle(fontSize: 16.0),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        size: 28.0,
                      ),
                      labelText: 'Username',
                    ),
                    validator: (input) => input.trim().length < 1
                        ? 'Please enter a valid name'
                        : null,
                    onSaved: (input) => _name = input,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
