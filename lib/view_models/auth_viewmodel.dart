import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsly_app/Routes/routes_name.dart';
import 'package:newsly_app/sevices/authentication_service.dart';
import 'package:newsly_app/models/user_model.dart' as u;

class AuthViewModel with ChangeNotifier {
  final AuthenticationService authService = AuthenticationService();

  Future<void> signUp(
      {required context,
      required email,
      required password,
      required String name,
      required String phoneNo}) async {
    bool result = await authService.signUpWithEmailAndPassword(email, password);
    if (result == true) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(u.User(
            email: email,
            dob: "",
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

  logout() {
    authService.logoutAuthentication();
    notifyListeners();
  }

  Future<void> signInWithGoogle({required context}) async {
    await authService.googleAuthentication();
    Navigator.pushNamed(context, bottomNavBar);
    notifyListeners();
  }
}
