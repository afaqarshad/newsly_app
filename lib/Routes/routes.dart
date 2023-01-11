import 'package:flutter/material.dart';
import 'package:newsly_app/Routes/routes_name.dart';
import 'package:newsly_app/views/screens/login_screen.dart';
import 'package:newsly_app/views/screens/news_source_screen.dart';
import 'package:newsly_app/views/screens/saved_artical_screen.dart';
import 'package:newsly_app/views/screens/signup_screen.dart';
import 'package:newsly_app/views/screens/splash_screen.dart';
import 'package:newsly_app/views/screens/home.dart';
import 'package:newsly_app/views/screens/profile_screen.dart';

import '../utils/bottomnavbar.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splash:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case onboardingscreen:
      return MaterialPageRoute(builder: (context) => const ProfilScreen());
    case home:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case savedartical:
      return MaterialPageRoute(
          builder: (context) => const SavedArticalScreen());
    case newssource:
      return MaterialPageRoute(builder: (context) => const NewsSourceScreen());
    case login:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case signup:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case bottomnavbar:
      return MaterialPageRoute(builder: (context) => BottomNavBar());
    default:
      return MaterialPageRoute(
        builder: (_) {
          return const Scaffold(
            body: Center(child: Text('Empty route')),
          );
        },
      );
  }
}
