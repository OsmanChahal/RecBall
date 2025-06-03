import 'package:flutter/material.dart';
import 'package:rec_ball/objects/match.dart';
import 'package:rec_ball/screens/match_screen.dart';
// import 'package:rec_ball/screens/match_screen.dart';

class GameCard extends StatefulWidget {
  final Match match;

  GameCard({required this.match});

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          //Container for the competition name
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              border: Border(
                bottom: BorderSide(
                  color: const Color.fromARGB(255, 220, 217, 217),
                ),
              ),
            ),
            height: 40,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.match.competitionName,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Container for the remaining box
          GestureDetector(
            onTapDown: (_) => setState(() => _isPressed = true),
            onTapUp: (_) => setState(() => _isPressed = false),
            onTapCancel: () => setState(() => _isPressed = false),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => MatchScreen(
                        match: widget.match,
                      ), // Pass the entire match object
                ),
              );
              // print("the button is pressed");
            },
            child: AnimatedScale(
              scale: _isPressed ? 0.98 : 1.0,
              duration: Duration(milliseconds: 100),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                width: double.infinity,
                height: 102,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Clubs colum
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Home team section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 8,
                                ),
                                child: SizedBox(
                                  height: 35,
                                  child: Image.network(
                                    widget.match.homeTeamLogo,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                ),
                                child: Text(
                                  widget.match.homeTeamName,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          //Away team section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 8,
                                ),
                                child: SizedBox(
                                  height: 35,
                                  child: Image.network(
                                    widget.match.awayTeamLogo,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                ),
                                child: Text(
                                  widget.match.awayTeamName,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        widget.match.utcDate,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
