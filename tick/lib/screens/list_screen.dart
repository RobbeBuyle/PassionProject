import 'package:flutter/material.dart';
import 'package:tick/models/checklist_model.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/services/auth_service.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/color_style.dart';
import 'package:tick/style/text_style.dart';
import 'package:tick/widgets/cards/list_preview.dart';
import 'package:tick/widgets/sections/category_selector.dart';
import 'package:tick/widgets/sections/homescreen_quote.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class ListItem {}

class ListScreen extends StatefulWidget {
  static final String id = 'list_screen';

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
          Container(
            child: CircleAvatar(
              radius: 29.0,
              backgroundColor: ColorsGrey300,
              backgroundImage: AssetImage('assets/images/user_placeholder.jpg'),
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
        ],
        elevation: 0.0,
        backgroundColor: ColorsLightBackground,
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
            // SliverToBoxAdapter(
            //   child: FlatButton(
            //     child: Text('Log Out'),
            //     onPressed: () => AuthService.logout(),
            //   ),
            // ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                //HERE COMES THE CUSTOM CODE FOR OUT LIST PREVIEWS
                CheckList checkList = lists[index];
                // return Container(
                //   alignment: Alignment.center,
                //   color: Colors.teal[100 * (index % 9)],
                //   child: Text('grid item $index'),
                // );
                return ListPreview(
                  checkList: checkList,
                );
              }, childCount: lists.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset('assets/images/AddSymbol.svg'),
        backgroundColor: ColorsWhite,
        onPressed: () {
          print('add note');
          Navigator.pushNamed(context, '/create');
        },
      ),
    );
  }
}
