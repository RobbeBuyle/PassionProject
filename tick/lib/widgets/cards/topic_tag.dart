import 'package:flutter/material.dart';
import 'package:tick/style/style.dart';

class TopicTag extends StatelessWidget {
  final String tag;
  final String coverPhotoUrl;

  TopicTag({this.tag, this.coverPhotoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: ColorsLightBackground,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topicTags.length,
        itemBuilder: (BuildContext context, int index) {
          TopicTag topicTag = topicTags[index];
          return GestureDetector(
            onTap: () {
              print('go to tag screen');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: ColorsWhite,
                image: DecorationImage(
                    image: AssetImage(topicTag.coverPhotoUrl),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: ColorsBlack.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 8, // changes position of shadow
                  ),
                ],
              ),
              width: 260.0,
              height: 160.0,
              margin: EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                topicTag.tag,
                style: TagTextStyle,
              )),
            ),
          );
        },
      ),
    );
  }
}

List<TopicTag> topicTags = [
  TopicTag(
    tag: '#Vacation',
    coverPhotoUrl: 'assets/images/topics/vacation.jpg',
  ),
  TopicTag(
    tag: '#Christmas',
    coverPhotoUrl: 'assets/images/topics/christmas.jpg',
  ),
  TopicTag(
    tag: '#Recipes',
    coverPhotoUrl: 'assets/images/topics/recipe.jpg',
  ),
  TopicTag(
    tag: '#School',
    coverPhotoUrl: 'assets/images/topics/school.jpg',
  ),
];
