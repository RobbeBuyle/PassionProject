import 'package:cloud_firestore/cloud_firestore.dart';

class Check {
  final String id;
  final String title;
  final bool isDone;

  Check({this.id, this.title, this.isDone});

  factory Check.fromDoc(DocumentSnapshot doc) {
    return Check(
      id: doc.documentID,
      title: doc['title'],
      isDone: doc['done'],
    );
  }
}
