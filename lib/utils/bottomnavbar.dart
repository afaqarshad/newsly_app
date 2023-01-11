import 'package:flutter/material.dart';
import 'package:newsly_app/views/screens/home.dart';
import 'package:newsly_app/views/screens/news_source_screen.dart';
import 'package:provider/provider.dart';
import '../view_models/bottomnavbar_viewmodel.dart';
import '../views/screens/profile_screen.dart';
import '../views/screens/saved_artical_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  List pages = [
    const HomeScreen(),
    const SavedArticalScreen(),
    const NewsSourceScreen(),
    const ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: 'Saved Artical'),
            BottomNavigationBarItem(
                icon: Icon(Icons.source), label: 'News Source'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: const Color(0xff1877F2),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          elevation: 20.0,
          onTap: context.read<BottomNavBarVM>().onTapItem),
      body: pages.elementAt(selectedIndex),
    );
  }
}