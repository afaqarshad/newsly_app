import 'package:flutter/material.dart';
import 'package:newsly_app/views/onboardng_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startDelay();
    debugPrint("Splash init");
  }

  startDelay() {
    Future.delayed(const Duration(seconds: 2), () {
      debugPrint("Time End");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: ((context) => const OnboardingView())),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
          ),
        ],
      ),
    );
  }
}
