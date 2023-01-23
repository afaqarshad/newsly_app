import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class CategoryDisplayViewModel with ChangeNotifier {
  Future<void> display(args) async {
    FirebaseFirestore.instance
        .collection('latest')
        .where(
          "tag",
          isEqualTo: args,
        )
        .snapshots();
    notifyListeners();
  }
}
