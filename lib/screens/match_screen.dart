import 'package:flutter/material.dart';
import 'package:rec_ball/objects/match.dart';

class MatchScreen extends StatefulWidget {
  final Match match;
  const MatchScreen({super.key, required this.match});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Match", style: TextStyle(fontSize: 30))),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.network(widget.match.homeTeamLogo),
                ),
                Text(
                  "4 - 1",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.network(
                    "https://crests.football-data.org/328.png",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Image.network("https://crests.football-data.org/ELC.png", height: 60),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.lightGreenAccent, Colors.green.shade300],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
