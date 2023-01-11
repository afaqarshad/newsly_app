import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsly_app/Routes/routes_name.dart';
import 'package:newsly_app/sevices/authentication_service.dart';

class AuthViewModel with ChangeNotifier {
  final AuthenticationServices authService = AuthenticationServices();

  void signUp(
      {required BuildContext context, required email, required password}) {
    authService.signUpAuthService(email, password);
    Navigator.pushNamed(context, bottomnavbar);
    notifyListeners();
  }

  void login({required context, required email, required password}) {
    authService.loginAuthentication(email, password);
    Navigator.pushNamed(context, bottomnavbar);
    notifyListeners();
  }

  logout() {
    authService.logoutAuthentication();
    notifyListeners();
  }

  void signInWithGoogle({required context}) async {
    await authService.googleAuthentication();
    Navigator.pushNamed(context, bottomnavbar);
    notifyListeners();
  }
}
