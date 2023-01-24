// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewsCategoryViewModel with ChangeNotifier {
  List<String> categoryItem = [
    'Latest',
    'Technology',
    'Sports',
    'Fashion',
    'Health'
  ];

  getNewcategory() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots() as Stream<QuerySnapshot<Object?>>?;
    notifyListeners();
  }
}
