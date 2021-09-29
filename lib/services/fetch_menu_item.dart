part of 'services.dart';

Future<List<Menu>> fetchMenuItem(int category) async {
  final url =
      APIURL + 'menu?restaurant_id=2&category_id=' + category.toString();
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseMenus(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

List<Menu> parseMenus(String responseBody) {
  final parsed = jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();

  return parsed.map<Menu>((json) => Menu.fromJson(json)).toList();
}
