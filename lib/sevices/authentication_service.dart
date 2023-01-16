import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? userEmail;

  Future<void> signUpWithEmailAndPassword(email, password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> loginAuthentication(email, password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      debugPrint("Login Success!");
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void logoutAuthentication() async {
    await firebaseAuth.signOut();
  }

  Future<UserCredential> googleAuthentication() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    userEmail = googleUser.email;
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
