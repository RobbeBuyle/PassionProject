import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/screens/list_screen.dart';

class CheckList implements ListItem {
  final String id;

  final String title;
  final String hashtag;
  // final List<Check> checks;
  final String check;
  final String authorId;
  final Timestamp timeStamp;
  final int saves;

  CheckList(
      {this.id,
      this.title,
      this.hashtag,
      this.check,
      this.authorId,
      this.timeStamp,
      this.saves});

  factory CheckList.fromDoc(DocumentSnapshot doc) {
    return CheckList(
      id: doc.documentID,
      title: doc['title'],
      hashtag: doc['hashtag'],
      check: doc['check'],
      authorId: doc['authorId'],
      timeStamp: doc['timeStamp'],
      saves: doc['saves'],
    );
  }
}

//USERS

final User kim = User(
    id: '545dsf4sd5gdfg4152sdg',
    name: 'kim',
    imageUrl: 'assets/images/kim.jpg',
    email: 'kim@yahoo.com',
    statsNotes: 34,
    statsSaves: 112,
    statsChecks: 248);

final User olivia = User(
    id: '545dsf4sd5gdfg4152sdk',
    name: 'olivia',
    imageUrl: 'assets/images/olivia.jpg',
    email: 'olivia@yahoo.com',
    statsNotes: 34,
    statsSaves: 112,
    statsChecks: 248);

final User tim = User(
    id: '545dsf4sd5gdfg4152sdt',
    name: 'tim',
    imageUrl: 'assets/images/tim.jpg',
    email: 'tim@yahoo.com',
    statsNotes: 34,
    statsSaves: 112,
    statsChecks: 248);

final User myriam = User(
    id: '545dsf4sd5gdfg4152sdg',
    name: 'myriam',
    imageUrl: 'assets/images/myriam.jpg',
    email: 'myriam@yahoo.com',
    statsNotes: 34,
    statsSaves: 112,
    statsChecks: 248);

List<CheckList> lists = [
  CheckList(
      id: 'jksdqhfksf',
      authorId: 'kim',
      title: '📖 English test',
      hashtag: '#school',
      check: 'practise vocab',
      saves: 16),
  CheckList(
      id: 'skljdfldsjlfdsf',
      authorId: 'olivia',
      title: '🧳 US Packing',
      hashtag: '#traveling',
      check: 'visa',
      saves: 16),
  CheckList(
      id: 'sjkdhfjkdshfksdf',
      authorId: 'tim',
      title: '🛒 Friday shopping',
      hashtag: '#shopping',
      check: 'Milk',
      saves: 16),
  CheckList(
      id: 'fjksdhfjkdshkfjsdf',
      authorId: 'myriam',
      title: '🎉 Weekend party',
      hashtag: '#party',
      check: 'Search playlist',
      saves: 16),
];
