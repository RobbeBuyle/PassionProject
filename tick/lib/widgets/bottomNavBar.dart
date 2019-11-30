import 'package:flutter/material.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final Function onBarTap;

  AnimatedBottomBar(
      {this.barItems,
      this.animationDuration = const Duration(milliseconds: 200),
      this.onBarTap});

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, -5.0), // changes position of shadow
            ),
          ],
        ),
        child: Material(
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 12.0, top: 12.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildBarItems(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();

    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = selectedBarIndex == i;
      _barItems.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
            widget.onBarTap(selectedBarIndex);
          });
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
              color:
                  isSelected ? item.color.withOpacity(0.1) : Colors.transparent,
              borderRadius: BorderRadius.circular(30)),
          duration: widget.animationDuration,
          child: Row(
            children: <Widget>[
              Icon(
                item.icon,
                color: isSelected ? item.color : Colors.grey[600],
                size: 24.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              AnimatedSize(
                duration: widget.animationDuration,
                curve: Curves.easeInOut,
                vsync: this,
                child: Text(
                  isSelected ? item.text : "",
                  style:
                      TextStyle(color: item.color, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ));
    }

    return _barItems;
  }
}

class BarItem {
  String text;
  IconData icon;
  Color color;

  BarItem({this.text, this.icon, this.color});
}
