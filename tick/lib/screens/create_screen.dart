import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick/models/checklist_model.dart';
import 'package:tick/models/user_data.dart';
import 'package:tick/services/database_services.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/color_style.dart';
import 'package:tick/style/text_style.dart';
import 'package:tick/widgets/sections/list_form.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _hashtag = '';
  String _check = '';

  bool _isLoading = false;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _hashtagController = TextEditingController();
  TextEditingController _checkController = TextEditingController();

  _submit() async {
    if (!_isLoading &&
        _title.isNotEmpty &&
        _hashtag.isNotEmpty &&
        _check.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      //create
      CheckList checkList = CheckList(
        title: _title,
        hashtag: _hashtag,
        check: _check,
        authorId: Provider.of<UserData>(context).currentUserId,
        timeStamp: Timestamp.fromDate(
          DateTime.now(),
        ),
        saves: 12,
      );
      DatabaseService.createCheckList(checkList);

      //reset data
      _titleController.clear();
      _hashtagController.clear();
      _checkController.clear();
      setState(() {
        _title = '';
        _hashtag = '';
        _check = '';
        _isLoading = false;
      });

      Navigator.pop(context);
    }
  }

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
      body: Form(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: TextFormField(
                            autofocus: true,
                            onChanged: (input) => _title = input,
                            controller: _titleController,
                            style: CreateListTitle,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]),
                                ),
                                hintText: "Title",
                                hintStyle: TextStyle(
                                  color: Colors.grey[300],
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: TextFormField(
                            onChanged: (input) => _hashtag = input,
                            controller: _hashtagController,
                            style: CreateListHashtag,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]),
                                ),
                                hintText: "category",
                                hintStyle: TextStyle(
                                  color: Colors.grey[300],
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          onChanged: (input) => _check = input,
                          controller: _checkController,
                          style: CreateListHashtag,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[300]),
                              ),
                              hintText: "check",
                              hintStyle: TextStyle(
                                color: Colors.grey[300],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
