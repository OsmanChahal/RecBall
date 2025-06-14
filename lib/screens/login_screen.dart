import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 40),
          Center(
            child: Text(
              "Welcom To RecBall",
              style: TextStyle(
                fontFamily: "InriaSerif",
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                "We are excited to join us",
                style: TextStyle(
                  fontFamily: "InriaSerif",
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.lightGreenAccent, Colors.green.shade300],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
