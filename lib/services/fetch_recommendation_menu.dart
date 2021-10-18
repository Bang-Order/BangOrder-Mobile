part of 'services.dart';

Future<List<Menu>> fetchRecommendationMenu() async {
  final url = APIURL + 'restaurants/1/menus?filter=recommendation';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseRecommendationMenu(response.body);
  } else {
    throw Exception('Failed to load data' + response.statusCode.toString());
  }
}

List<Menu> parseRecommendationMenu(String responseBody) {
  final parsed = jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();

  return parsed.map<Menu>((json) => Menu.fromJson(json)).toList();
}
