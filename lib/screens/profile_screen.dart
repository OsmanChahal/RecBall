import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset('Images/jersey.webp'),
            Positioned(
              top: 125,
              left: 0,
              right: 0,
              child: Text(
                "OSMAN",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 130,
              left: 0,
              right: 0,
              child: Text(
                '99',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 5, color: Colors.black)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
