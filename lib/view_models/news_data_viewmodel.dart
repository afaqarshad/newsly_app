import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class NewsDataViewmodel with ChangeNotifier {
  String? _data;

  get data => _data;

  setdata() async {
    var snap = FirebaseFirestore.instance.collection('latest').snapshots();
    _data = data;
    // snap.notifyListeners();
  }
}
