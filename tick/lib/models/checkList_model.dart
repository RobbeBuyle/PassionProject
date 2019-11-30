import 'package:tick/models/user_model.dart';

import 'check_model.dart';

class checkList {
  final User author;

  final String title;
  final String tag;
  final List<Check> checks;
  final String date;
  final int saves;

  checkList(
      this.author, this.title, this.tag, this.checks, this.date, this.saves);
}
