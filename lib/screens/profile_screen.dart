import 'package:flutter/material.dart';
import 'package:rec_ball/screens/login_screen.dart';
import 'package:rec_ball/screens/signup_screen.dart';

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
        child: Column(
          children: [
            Stack(
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontFamily: "InriaSerif",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Colors.blueAccent,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Log-In",
                    style: TextStyle(
                      fontFamily: "InriaSerif",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
