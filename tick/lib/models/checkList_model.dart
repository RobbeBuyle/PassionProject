import 'package:tick/models/user_model.dart';
import 'package:tick/screens/list_screen.dart';

import 'check_model.dart';

class CheckList implements ListItem {
  final User author;

  final String title;
  final String tag;
  // final List<Check> checks;
  final String check;
  final String date;
  final int saves;

  CheckList(
      {this.author, this.title, this.tag, this.check, this.date, this.saves});

  save() {
    print('save ${this.title} list using FireBase');
  }
}

//USERS

final User kim = User(
    id: 0,
    name: 'kim',
    imageUrl: 'assets/images/kim.jpg',
    email: 'kim@yahoo.com',
    statsNotes: 34,
    statsSaves: 112,
    statsChecks: 248);

final User olivia = User(
    id: 1,
    name: 'olivia',
    imageUrl: 'assets/images/olivia.jpg',
    email: 'olivia@yahoo.com',
    statsNotes: 34,
    statsSaves: 112,
    statsChecks: 248);

final User tim = User(
    id: 2,
    name: 'tim',
    imageUrl: 'assets/images/tim.jpg',
    email: 'tim@yahoo.com',
    statsNotes: 34,
    statsSaves: 112,
    statsChecks: 248);

final User myriam = User(
    id: 3,
    name: 'myriam',
    imageUrl: 'assets/images/myriam.jpg',
    email: 'myriam@yahoo.com',
    statsNotes: 34,
    statsSaves: 112,
    statsChecks: 248);

List<CheckList> lists = [
  CheckList(
      author: kim,
      title: '📖 English test',
      tag: '#school',
      check: 'practise vocab',
      date: '16/11/19',
      saves: 16),
  CheckList(
      author: olivia,
      title: '🧳 US Packing',
      tag: '#traveling',
      check: 'visa',
      date: '16/11/19',
      saves: 16),
  CheckList(
      author: tim,
      title: '🛒 Friday shopping',
      tag: '#shopping',
      check: 'Milk',
      date: '16/11/19',
      saves: 16),
  CheckList(
      author: myriam,
      title: '🎉 Weekend party',
      tag: '#party',
      check: 'Search playlist',
      date: '16/11/19',
      saves: 16),
];
