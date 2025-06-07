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
      appBar: AppBar(),
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
                  widget.match.status == "FINISHED"
                      ? '${widget.match.fullTimeHomeScore} - ${widget.match.fullTimeAwayScore}'
                      : widget.match.utcDate,
                  style:
                      widget.match.status != "FINISHED"
                          ? TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                          : TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: "InriaSerif",
                          ),
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.network(widget.match.awayTeamLogo),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 60,
            child:
                (widget.match.compatitionLogo != null &&
                        widget.match.compatitionLogo!.isNotEmpty)
                    ? Image.network(
                      widget.match.compatitionLogo!,
                      fit: BoxFit.contain,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.sports_soccer, size: 60),
                    )
                    : Icon(Icons.sports_soccer, size: 60),
          ),
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
