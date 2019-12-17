import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tick/models/check_model.dart';
import 'package:tick/models/checklist_model.dart';
import 'package:tick/models/user_model.dart';
import 'package:tick/utilities/constants.dart';

class DatabaseService {
  static void updateUser(User user) {
    usersRef.document(user.id).updateData({
      'name': user.name,
      'profileImageUrl': user.imageUrl,
    });
  }

  static void createCheckList(CheckList checkList) {
    checkListRef.document(checkList.authorId).collection('userCheckLists').add({
      //auto generate id
      'title': checkList.title,
      'hashtag': checkList.hashtag,
      'check': checkList.check,
      'saves': checkList.saves,
      'timeStamp': checkList.timeStamp,
      'authorId': checkList.authorId,
    });
  }

  // static void createCheck(Check checkList) {
  //   checkListRef.document(checkList.authorId).collection('userCheckLists')
  // }

  static Future<List> getChecks() async {
    QuerySnapshot checkSnapshot = await checkRef.getDocuments();

    List<Check> checks =
        checkSnapshot.documents.map((doc) => Check.fromDoc(doc)).toList();
    return checks;
  }

  static Future<List<CheckList>> getCheckLists(String userId) async {
    // print('allo, $userId');

    QuerySnapshot checkListsSnapshot = await checkListRef
        .document(userId)
        .collection('userCheckLists')
        .orderBy('timeStamp', descending: true)
        .getDocuments();
    // print(checkListsSnapshot.documents);

    List<CheckList> checkLists = checkListsSnapshot.documents
        .map((doc) => CheckList.fromDoc(doc))
        .toList();
    return checkLists;
  }

  static Future<User> getUserWithId(String userId) async {
    DocumentSnapshot userDocSnapshot = await usersRef.document(userId).get();
    if (userDocSnapshot.exists) {
      return User.fromDoc(userDocSnapshot);
    }
    return User();
  }
}
