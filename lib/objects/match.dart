import 'package:intl/intl.dart';

class Match {
  final int id;
  final String homeTeamLogo;
  final String homeTeamName;
  final String awayTeamLogo;
  final String awayTeamName;
  final String competitionName;
  final int? matchDay;
  final String utcDate;

  Match({
    required this.awayTeamLogo,
    required this.awayTeamName,
    required this.competitionName,
    required this.homeTeamLogo,
    required this.homeTeamName,
    required this.id,
    required this.matchDay,
    required this.utcDate,
  });

  String get formattedMatchTime {
    final dateTime = DateTime.parse(utcDate).toLocal();
    final timeFormat = DateFormat('HH:mm');
    return timeFormat.format(dateTime);
  }

  // Getter for a more user-friendly match day display
  String get displayMatchDay {
    if (matchDay != null) {
      return 'Matchday $matchDay';
    } else {
      return 'Matchday Info Unavailable';
    }
  }

  factory Match.fromJson(Map<String, dynamic> json) {
    final homeTeam = json['homeTeam'] as Map<String, dynamic>?;
    final awayTeam = json['awayTeam'] as Map<String, dynamic>?;
    final competition = json['competition'] as Map<String, dynamic>?;

    return Match(
      id: json['id'] as int,
      homeTeamName: homeTeam?['name'] as String,
      homeTeamLogo: homeTeam?['crest'] as String,
      awayTeamName: awayTeam?['name'] as String,
      awayTeamLogo: awayTeam?['crest'] as String,
      competitionName: competition?['name'] as String,
      matchDay: json['matchday'] as int?,
      utcDate: json['utcDate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'homeTeamName': homeTeamName,
      'homeTeamLogo': homeTeamLogo,
      'awayTeamName': awayTeamName,
      'awayTeamLogo': awayTeamLogo,
      'competitionName': competitionName,
      'matchDay': matchDay,
      'utcDate': utcDate,
    };
  }
}
