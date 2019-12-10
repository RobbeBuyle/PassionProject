import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String imageUrl;
  final String email;
  final int statsNotes;
  final int statsSaves;
  final int statsChecks;

  User(
      {this.id,
      this.name,
      this.imageUrl,
      this.email,
      this.statsNotes,
      this.statsSaves,
      this.statsChecks});

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      id: doc.documentID,
      name: doc['name'],
      imageUrl: doc['profileImageUrl'],
      email: doc['email'],
      statsNotes: doc['statsNotes'] ?? 0,
      statsSaves: doc['statsSaves'] ?? 0,
      statsChecks: doc['statsNotes'] ?? 0,
    );
  }
}

final User currentUser = User(
    id: '545dsf4sd5gdfg4152sdf',
    name: 'Myriam.dietchy',
    imageUrl: 'assets/images/myriam.jpg',
    email: 'myriam.dietchy@yahoo.com',
    statsNotes: 34,
    statsSaves: 112,
    statsChecks: 248);
