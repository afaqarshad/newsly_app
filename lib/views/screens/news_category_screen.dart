import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsly_app/Routes/routes_name.dart';
import 'package:newsly_app/models/user_model.dart';
import 'package:newsly_app/view_models/news_Category_ViewModel.dart';

class NewsCategoryScreen extends StatelessWidget {
  NewsCategoryScreen({super.key});

  final NewsCategoryViewModel newsCategoryViewModel = NewsCategoryViewModel();

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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                !(snapshot.hasData)) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            UserModel user = UserModel.fromJson(snapshot.data!.data()!);

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
                  trailing: ElevatedButton(
                    onPressed: () async {
                      //if following
                      if (user.followedCategories.contains(
                          newsCategoryViewModel.categoryItem[index])) {
                        List tempList = [
                          newsCategoryViewModel.categoryItem[index]
                        ];

                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update({
                          "followedCategories": FieldValue.arrayRemove(tempList)
                        });
                      } else {
                        List tempList = [
                          newsCategoryViewModel.categoryItem[index]
                        ];

                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update({
                          "followedCategories": FieldValue.arrayUnion(tempList)
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: user.followedCategories.contains(
                              newsCategoryViewModel.categoryItem[index])
                          ? Colors.green
                          : null,
                    ),
                    child: Text(user.followedCategories
                            .contains(newsCategoryViewModel.categoryItem[index])
                        ? "Following"
                        : "Follow"),
                  ),
                );
              },
            );
          }),
    );
  }
}
