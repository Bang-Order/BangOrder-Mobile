part of 'services.dart';

Future<List<MenuCategory>> fetchCategoryHeader() async {
  final url = APIURL + 'restaurants/1/menu-categories';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseMenuCategories(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

List<MenuCategory> parseMenuCategories(String responseBody) {
  final parsed = jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();

  return parsed
      .map<MenuCategory>((json) => MenuCategory.fromJson(json))
      .toList();
}
