import 'package:flutter/material.dart';
import 'package:tick/models/checklist_model.dart';
import 'package:tick/style/color_style.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/text_style.dart';

class DetailScreen extends StatefulWidget {
  final CheckList checkList;

  DetailScreen({this.checkList});

  @override
  _DetailScreenState createState() => _DetailScreenState(checkList);
}

class _DetailScreenState extends State<DetailScreen> {
  _submit() {}
  final _formKey = GlobalKey<FormState>();

  CheckList checkList;
  _DetailScreenState(this.checkList);

  @override
  Widget build(BuildContext context) {
    print('xd');
    print(checkList.title);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          checkList.title,
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
                            initialValue: checkList.title,
                            autofocus: false,
                            // onChanged: (input) => _title = input,
                            // controller: _titleController,
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
                            // onChanged: (input) => _hashtag = input,
                            // controller: _hashtagController,
                            initialValue: checkList.hashtag,
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
                          // onChanged: (input) => _check = input,
                          // controller: _checkController,
                          initialValue: checkList.check,
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
