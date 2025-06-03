import 'package:flutter/material.dart';

class NextGameBox extends StatelessWidget {
  final String date;
  final String homeTeamLogo;
  final String awayTeamLogo;
  final String competitionLogo;

  NextGameBox({
    required this.date,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
    required this.competitionLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 14),
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: 140,
      height: 116,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(homeTeamLogo, width: 40, height: 40),
                SizedBox(width: 32),
                Image.network(awayTeamLogo, width: 40, height: 40),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(date, style: TextStyle(fontSize: 10))],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.network(competitionLogo, width: 30)],
          ),
        ],
      ),
    );
  }
}
