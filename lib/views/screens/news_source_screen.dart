import 'package:flutter/material.dart';
import 'package:newsly_app/Routes/routes_name.dart';

class NewsSourceScreen extends StatelessWidget {
  NewsSourceScreen({super.key});

  final List<String> categoryItem = [
    'Latest',
    'Technology',
    'Sports',
    'Fashion',
    'Health'
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
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
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: categoryItem.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              categoryItem[index],
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            onTap: () {
              Navigator.pushNamed(context, categortdisplayscreen,
                  arguments: categoryItem[index].toLowerCase());
            },
          );
        },
      ),
    );
  }
}
