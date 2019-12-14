import 'package:flutter/material.dart';
import 'package:tick/style/color_style.dart';
import 'package:tick/style/text_style.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> catagories = [
    'All',
    'Pesonal',
    'Saved',
    '#Recipe',
    '#School'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.0,
      color: ColorsLightBackground,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50.0, 0, 0, 0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catagories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 40.0),
                child: index == selectedIndex
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: ColorsYellow.withOpacity(0.10),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20.0),
                        child: Text(
                          catagories[index],
                          style: CategorySelected,
                        ),
                      )
                    : Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20.0),
                        child: Text(
                          catagories[index],
                          style: CategoryUnselected,
                        ),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
