import 'package:flutter/cupertino.dart';
import 'package:newsly_app/models/news_model.dart';

class SavedArticlesViewModel extends ChangeNotifier {
  final List<NewsModel> savedArticles = [];

  void addArticle(NewsModel news) {
    savedArticles.add(news);
    notifyListeners();
  }

  void removeArticle(NewsModel news) {
    savedArticles.remove(news);
    notifyListeners();
  }

  bool isArticleSaved(NewsModel news) =>
      savedArticles.contains(news) ? true : false;

  int get totalArticles => savedArticles.length;

  bool get savedArticlesNotEmpty => savedArticles.isNotEmpty;
}
