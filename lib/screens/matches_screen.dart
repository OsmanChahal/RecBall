import 'package:flutter/material.dart';
import 'package:rec_ball/Requests/matches_on_dates.dart';
import 'package:rec_ball/widgets/dates_bar.dart';
import 'package:rec_ball/widgets/game_card.dart';
import 'package:rec_ball/objects/match.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  Future<Map<String, dynamic>>? _matchesDataFuture;
  DateTime currentDisplayedDate = DateTime.now().toLocal();
  @override
  void initState() {
    super.initState();
    _matchesDataFuture = matchesOnDate(currentDisplayedDate);
  }

  void _handleDateSelected(DateTime selectedDate) {
    if (currentDisplayedDate.year != selectedDate.year ||
        currentDisplayedDate.month != selectedDate.month ||
        currentDisplayedDate.day != selectedDate.day) {
      setState(() {
        currentDisplayedDate = selectedDate;
        _matchesDataFuture = matchesOnDate(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE0E0E0),
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff596B5B),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Center(
              child: Text(
                "Matches",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
          DatesBar(onDateSelected: _handleDateSelected),
          // Games placeholder
          Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: _matchesDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error On Loading Data: ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  final matchesData = snapshot.data;
                  if (matchesData != null &&
                      matchesData.containsKey("matches")) {
                    final List<dynamic> rawMatches =
                        matchesData["matches"] as List<dynamic>;
                    final List<Match> matchesList =
                        rawMatches.map((json) => Match.fromJson(json)).toList();
                        
                    if (matchesList.isEmpty) {
                      return Image.asset(
                        "Images/decision_no_matches_var.png",
                        height: 100,
                        width: 100,
                      );
                    }
                    return ListView.builder(
                      itemCount: matchesList.length,
                      itemBuilder: (context, index) {
                        final Match match = matchesList[index];
                        return GameCard(match: match);
                      },
                    );
                  } else {
                    return const Center(child: Text("No data"));
                  }
                } else {
                  return const Center(child: Text("No data loaded yet"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
