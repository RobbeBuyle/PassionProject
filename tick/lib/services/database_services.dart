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
}
