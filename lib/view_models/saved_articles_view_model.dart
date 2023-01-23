import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsly_app/models/news_model.dart';

class SavedArticlesViewModel extends ChangeNotifier {
  final List<NewsModel> savedArticles = [];
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addArticle(NewsModel news) async {
    savedArticles.add(news);
    await firestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'savedArticle': FieldValue.arrayUnion([news.toJson()])
    });
    notifyListeners();
  }

  void removeArticle(NewsModel news) {
    savedArticles.remove(news);
    notifyListeners();
  }
}
