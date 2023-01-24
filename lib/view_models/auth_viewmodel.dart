import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsly_app/Routes/routes_name.dart';
import 'package:newsly_app/models/user_model.dart';
import 'package:newsly_app/sevices/authentication_service.dart';

class AuthViewModel with ChangeNotifier {
  final AuthenticationService authService = AuthenticationService();

  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();

  Future<void> signUp(
      {required context,
      required email,
      required password,
      required String name,
      required String phoneNo,
      required String dob}) async {
    bool result = await authService.signUpWithEmailAndPassword(email, password);
    if (result == true) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(UserModel(
            followedCategories: [],
            savedArticle: [],
            email: email,
            dob: dob,
            fullName: name,
            phoneNum: phoneNo,
            id: FirebaseAuth.instance.currentUser!.uid,
          ).toJson());

      Navigator.pushReplacementNamed(context, bottomNavBar);
    } else {
      return;
    }
    notifyListeners();
  }

  Future<void> login(
      {required context, required email, required password}) async {
    bool result = await authService.loginAuthentication(email, password);
    if (result == true) {
      Navigator.pushReplacementNamed(context, bottomNavBar);
    } else {
      return;
    }
    notifyListeners();
  }

  void logout({required context}) async {
    await authService.logoutAuthentication();
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneNumController.clear();
    dobController.clear();
    Navigator.pushReplacementNamed(context, logIn);
    notifyListeners();
  }

  Future<void> signInWithGoogle({required context}) async {
    await authService.googleAuthentication();
    Navigator.pushNamed(context, bottomNavBar);
    notifyListeners();
  }
}
