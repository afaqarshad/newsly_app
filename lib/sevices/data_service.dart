import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsly_app/models/user_model.dart';

class DataService {
  static UserModel? myUser;

  static Future getMyUser() async {
    print(FirebaseAuth.instance.currentUser!.uid);
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
    myUser = UserModel.fromJson(documentSnapshot.data()!);
  }

  Stream<QuerySnapshot> getCategoryArticlesStream(String data) {
    return FirebaseFirestore.instance
        .collection('latest')
        .where(
          "tag",
          isEqualTo: data,
        )
        .snapshots();
  }

  Stream<QuerySnapshot> homeNewsListStream() {
    return FirebaseFirestore.instance.collection('latest').snapshots();
  }

  Future<List> showfollowedArticle() async {
    DocumentSnapshot<Map<String, dynamic>> userSnap = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    UserModel user = UserModel.fromJson(userSnap.data()!);
    return user.followedCategories;
  }

  Stream<QuerySnapshot> homeSlideNewsListStream() {
    return FirebaseFirestore.instance
        .collection('latest')
        .where("tag", isEqualTo: "latest")
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> newsCategoryStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }
}
