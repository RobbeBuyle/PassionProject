import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/services/database_services.dart';
import 'package:tick/services/storage_service.dart';
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
  File _profileImage;
  bool _isloading = false;

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
  }

  _handleImageFromGallery() async {
    print('edit img');
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      setState(() {
        _profileImage = imageFile;
      });
    }
  }

  test() {
    print('allo');
  }

  _displayProfileImage() {
    if (_profileImage == null) {
      if (widget.user.imageUrl.isEmpty) {
        return AssetImage('assets/images/user_placeholder.jpg');
      } else {
        return CachedNetworkImageProvider(widget.user.imageUrl);
      }
    } else {
      return FileImage(_profileImage);
    }
  }

  _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        _isloading = true;
      });

      String _profileImageUrl = '';

      if (_profileImage == null) {
        _profileImageUrl = widget.user.imageUrl;
      } else {
        _profileImageUrl = await StorageService.uploadUserProfileImage(
          widget.user.imageUrl,
          _profileImage,
        );
      }

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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          children: <Widget>[
            _isloading
                ? LinearProgressIndicator(
                    backgroundColor: ColorsBlue.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation(ColorsBlue),
                  )
                : SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 14.0),
                      child: Container(
                        width: 122.0,
                        height: 122.0,
                        child: new CircleAvatar(
                          backgroundColor: ColorsGrey300,
                          backgroundImage: _displayProfileImage(),
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () => _handleImageFromGallery(),
                      child: Text(
                        'Change profile image',
                        style: secondaryButtonTextStyle,
                      ),
                      // splashColor: Colors.transparent,
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
          ],
        ),
      ),
    );
  }
}
