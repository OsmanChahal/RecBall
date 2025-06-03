import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rec_ball/screens/home_screen_content.dart';
import 'package:rec_ball/screens/matches_screen.dart';
import 'package:rec_ball/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeScreenContent(),
    MatchesScreen(),
    ProfileScreen(),
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xff596B5B),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: GNav(
            backgroundColor: Color(0xff596B5B),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromARGB(47, 199, 199, 199),
            padding: EdgeInsets.all(15),
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              });
            },
            gap: 8,
            tabs: [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.sports_soccer_rounded, text: "Matches"),
              GButton(icon: Icons.person, text: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
