import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsly_app/utils/app_toast.dart';

class AuthenticationService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? userEmail;

  Future<bool> signUpWithEmailAndPassword(email, password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password!,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "unknown") {
        debugPrint("Some fild miss please double check");
      } else if (e.code == "invalid-email") {
        debugPrint("Your email format is not correct please try again");
      } else if (e.code == "weak-password") {
        debugPrint("Password should be greater then 6 digit");
      } else if (e.code == "email-already-in-use") {
        debugPrint("Your email already exist please try another email");
      }
      debugPrint("Firebase e $e");
      return false;
    } catch (e) {
      debugPrint("e $e");
      return false;
    }
  }

  Future<bool> loginAuthentication(email, password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      userCredential.user;

      AppToast.successToast(masg: "SingUp Success!");
      debugPrint("Login Success!");
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint("Firebae Auth $e");
      if (e.code == "wrong-password") {
        AppToast.failToast(masg: "Your Password is Wrong Please try again");
      } else if (e.code == "user-not-found") {
        AppToast.failToast(masg: "Email not Found Please try again");
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<void> logoutAuthentication() async {
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
