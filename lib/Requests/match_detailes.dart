import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> matchDetailes(int matchID) async {
  final url = Uri.parse("https://api.football-data.org/v4/matches/${matchID}");
  final token = "69e989c4b04b41e9b9629253218cb914";

  final response = await http.get(url, headers: {'X-Auth-Token': token});

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data;
  } else {
    throw Exception("Failed to load matches");
  }
}