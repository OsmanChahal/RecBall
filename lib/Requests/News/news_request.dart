import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Map<String, dynamic>>> fetchFootballNews() async {
  final String apiKey = '557c3cf257b0465a8b42ee2752fd1c60';
  final String url = Uri.encodeFull(
    'https://newsapi.org/v2/everything?q="football" AND ("premier league" OR "la liga" OR "champions league") NOT "american football"'
    '&searchIn=title,content'
    '&language=en'
    '&from=2025-05-28'
    '&sortBy=publishedAt'
    '&pageSize=20',
  );

  final response = await http.get(
    Uri.parse(url),
    headers: {'X-Api-Key': apiKey},
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['articles'] != null && data['articles'] is List) {
      return List<Map<String, dynamic>>.from(data['articles']);
    }
    return [];
  } else {
    print('Request failed with status: ${response.statusCode}');
    print('Error: ${response.body}');
    return [];
  }
}

void main() {
  fetchFootballNews();
}
