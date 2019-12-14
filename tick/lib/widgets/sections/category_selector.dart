import 'package:flutter/material.dart';
import 'package:tick/style/style.dart';

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
        padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
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
                    horizontal: 22.0, vertical: 40.0),
                child: Text(
                  catagories[index],
                  style: TextStyle(
                      color:
                          index == selectedIndex ? ColorsYellow : ColorsGrey300,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
