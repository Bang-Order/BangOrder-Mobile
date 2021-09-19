part of 'services.dart';

Future<List<Menus>> fetchMenuItem(category) async {
  final url = APIURL + 'category-menu?category=' + category;
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseMenus(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

List<Menus> parseMenus(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Menus>((json) => Menus.fromJson(json)).toList();
}
