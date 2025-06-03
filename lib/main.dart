import 'package:flutter/material.dart';
import 'package:rec_ball/screens/home_screen.dart';
import 'package:rec_ball/screens/match_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required before Firebase.init
  await Firebase.initializeApp(); // Initializes Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {'/': (context) => HomeScreen()},
      // home: HomeScreen(),
    );
  }
}

