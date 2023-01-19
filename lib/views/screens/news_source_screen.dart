import 'package:flutter/material.dart';
import 'package:newsly_app/Routes/routes_name.dart';
import 'package:newsly_app/view_models/news_Category_ViewModel.dart';
import 'package:provider/provider.dart';

class NewsSourceScreen extends StatelessWidget {
  const NewsSourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'News Sources',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Consumer<NewsCategoryViewModel>(
        builder: (context, newsCategoryViewModel, child) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: newsCategoryViewModel.categoryItem.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  newsCategoryViewModel.categoryItem[index],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                onTap: () {
                  Navigator.pushNamed(context, categortdisplayscreen,
                      arguments: newsCategoryViewModel.categoryItem[index]
                          .toLowerCase());
                },
              );
            },
          );
        },
      ),
    );
  }
}
