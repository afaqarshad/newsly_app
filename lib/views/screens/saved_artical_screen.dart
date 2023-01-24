import 'package:flutter/material.dart';
import 'package:newsly_app/resources/widgets/saved_article_widget.dart';
import 'package:newsly_app/view_models/saved_articles_view_model.dart';
import 'package:provider/provider.dart';

class SavedArticlesScreen extends StatelessWidget {
  const SavedArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Saved Articles',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Consumer<SavedArticlesViewModel>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.savedArticles.length,
              itemBuilder: ((context, index) {
                return SavedArticleWidget(
                  news: value.savedArticles[index],
                );
              }));
        },
      ),
    );
  }
}
