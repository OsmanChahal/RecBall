import 'package:flutter/material.dart';
import 'package:rec_ball/Requests/next_match_request.dart';
import 'package:rec_ball/widgets/news_card.dart';
import 'package:rec_ball/widgets/next_game_box.dart';
import 'package:rec_ball/Requests/News/news_request.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  List<Map<String, dynamic>> gamesData = [];
  List<Map<String, dynamic>> news = [];
  bool _isLoading = true;

  Future<void> fetchNextGameData() async {
    final data = await nextMatch();
    setState(() {
      gamesData.add(data);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }

  Future<void> _loadAllData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final gameResponse = await nextMatch();
      if (gameResponse.containsKey('matches') &&
          gameResponse['matches'] is List) {
        setState(() {
          gamesData.add(gameResponse);
        });
      }

      final newsResponse = await fetchFootballNews();
      setState(() {
        news = newsResponse;
      });
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Container(color: Color(0xff596B5B), height: 75),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff596B5B),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            height: 132,
            padding: EdgeInsets.only(bottom: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: gamesData.length,
              itemBuilder: (context, index) {
                final gameData = gamesData[index];
                if (gameData.containsKey('matches') &&
                    gameData['matches'] is List &&
                    (gameData['matches'] as List).isNotEmpty) {
                  final date = gameData['matches'][0]['utcDate'];
                  final homeTeamLogo =
                      gameData['matches'][0]['homeTeam']['crest'];
                  final awayTeamLogo =
                      gameData['matches'][0]['awayTeam']['crest'];
                  final competitionLogo =
                      gameData['matches'][0]['competition']['emblem'];
                  return NextGameBox(
                    date: date,
                    homeTeamLogo: homeTeamLogo,
                    awayTeamLogo: awayTeamLogo,
                    competitionLogo: competitionLogo,
                  );
                } else {
                  return Center(
                    child: Text(
                      "No matches available",
                      style: TextStyle(fontSize: 32),
                    ),
                  );
                }
              },
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                final atricle = news[index];
                return NewsCard(
                  imageURL: atricle['urlToImage'],
                  title: atricle['title'],
                  description: atricle['description'],
                  author: atricle['author'] ?? "Unkown Author",
                  source: atricle['source']?['name'] ?? 'Unkown Source',
                  date:
                      atricle['publishedAt'] != null
                          ? DateTime.parse(
                            atricle['publishedAt'],
                          ).toLocal().toString().split(" ")[0]
                          : "No Date",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
