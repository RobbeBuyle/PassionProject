import 'package:flutter/material.dart';
import 'package:tick/models/checklist_model.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/style.dart';
import 'package:tick/widgets/sections/category_selector.dart';
import 'package:tick/widgets/sections/homescreen_quote.dart';
import 'package:tick/models/user_model.dart';

abstract class ListItem {}

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLightBackground,
      appBar: AppBar(
        title: Text(
          'Hi, ${currentUser.name}',
          style: AppBarTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FlutterIcons.notifications),
          ),
          SizedBox(
            width: 32.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              currentUser.imageUrl,
              height: 36.0,
              width: 36.0,
            ),
          ),
        ],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: HomescreenQuote(),
            ),
            SliverToBoxAdapter(
              child: CategorySelector(),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                //HERE COMES THE CUSTOM CODE FOR OUT LIST PREVIEWS
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              }, childCount: 30),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: ColorsWhite,
        onPressed: () {
          print('add note');
          Navigator.pushNamed(context, '/create');
        },
      ),
    );
  }
}
