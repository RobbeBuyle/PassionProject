import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tick/models/check_model.dart';
import 'package:tick/models/checklist_model.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/screens/detail_view.dart';
import 'package:tick/services/auth_service.dart';
import 'package:tick/services/database_services.dart';
import 'package:tick/style/flutter_icons_icons.dart';
import 'package:tick/style/color_style.dart';
import 'package:tick/style/text_style.dart';
import 'package:tick/widgets/cards/list_preview.dart';
import 'package:tick/widgets/sections/category_selector.dart';
import 'package:tick/widgets/sections/homescreen_quote.dart';
import 'package:flutter_svg/flutter_svg.dart';

// abstract class ListItem {}

class ListScreen extends StatefulWidget {
  static final String id = 'list_screen';
  final String currentUserId;

  ListScreen({this.currentUserId});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<CheckList> _checkLists = [];
  List<Check> _checks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _setupList();
    _loadChecks();
  }

  _loadChecks() async {
    List<Check> checks = await DatabaseService.getChecks();
    print(checks);

    setState(() {
      _checks = checks;
    });
  }

  _setupList() async {
    List<CheckList> checkLists =
        await DatabaseService.getCheckLists(widget.currentUserId);
    // print(checkLists);
    setState(() {
      _checkLists = checkLists;
    });
  }

  _buildCheck(Check check, User author) {
    return Container(
      child: Text(check.title),
    );
  }

  _buildCheckList(CheckList checkList, User author) {
    return GestureDetector(
      onTap: () {
        print('add note');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      checkList: checkList,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: ColorsWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, -5.0), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                checkList.title,
                style: Title1TextStyle,
              ),
              SizedBox(
                height: 20.0,
              ),
              // Text(
              //   checkList.check,
              //   style: Body1TextStyle,
              // ),
            ],
          ),
        ),
      ),
    );
  }

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
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                //HERE COMES THE CUSTOM CODE FOR OUT LIST PREVIEWS
                // return Container(
                //   alignment: Alignment.center,
                //   color: Colors.teal[100 * (index % 9)],
                //   child: Text('grid item $index'),
                // );
                Check check = _checks[index];
                CheckList checkList = _checkLists[index];
                return FutureBuilder(
                  future: DatabaseService.getUserWithId(checkList.authorId),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    User author = snapshot.data;
                    return _buildCheck(check, author);
                  },
                );
              }, childCount: _checks.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
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

            _checkLists.length > 0
                ? SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      //HERE COMES THE CUSTOM CODE FOR OUT LIST PREVIEWS
                      // return Container(
                      //   alignment: Alignment.center,
                      //   color: Colors.teal[100 * (index % 9)],
                      //   child: Text('grid item $index'),
                      // );
                      CheckList checkList = _checkLists[index];
                      return FutureBuilder(
                        future:
                            DatabaseService.getUserWithId(checkList.authorId),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          User author = snapshot.data;
                          return _buildCheckList(checkList, author);
                        },
                      );
                    }, childCount: _checkLists.length),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2.0,
                      crossAxisSpacing: 2.0,
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Center(child: Text('No lists yet 😮')),
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
