import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

Future<Map<String, dynamic>> matchesOnDate(DateTime date) async {
  final token = "69e989c4b04b41e9b9629253218cb914";
  final String formattedDate = DateFormat('yyyy-MM-dd').format(date);
  final url = Uri.parse("https://api.football-data.org/v4/matches/?date=$formattedDate");

  final response = await http.get(url, headers: {'X-Auth-Token': token});

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
    return data;
  } else {
    throw Exception("Failed to load matches");
  }
}
