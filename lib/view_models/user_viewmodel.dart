import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UserViewModel with ChangeNotifier {
  firebaseCollection({
    required BuildContext context,
    required TextEditingController fullNameController,
    required TextEditingController emailController,
    required TextEditingController phoneNumController,
  }) {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('items').doc().set(
      {
        'fullname': fullNameController.text,
        'email': emailController.text,
        'uid': uid,
        'phonenum': false,
      },
    );
    fullNameController.clear();
    emailController.clear();
    phoneNumController.clear();
    notifyListeners();
  }
}
