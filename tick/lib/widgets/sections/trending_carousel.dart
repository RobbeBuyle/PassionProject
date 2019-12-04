import 'package:flutter/material.dart';
import 'package:tick/models/checklist_model.dart';
import 'package:tick/style/style.dart';

class TrendingCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'Trending',
                style: TitleTextStyle,
              ),
              GestureDetector(
                onTap: () {
                  print('See All');
                },
                child: Text(
                  'See all',
                  style: TextButton,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 200.0,
          color: ColorsLightBackground,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lists.length,
            itemBuilder: (BuildContext context, int index) {
              CheckList checkList = lists[index];
              return Container(
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
                width: 160.0,
                height: 190.0,
                margin: EdgeInsets.all(8.0),
                child: Text(
                  checkList.title,
                  style: Title1TextStyle,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
