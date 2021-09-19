part of 'services.dart';

Future<List<MenuCategories>> fetchCategoryHeader() async {
  final url = APIURL + 'menu-category';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseMenuCategories(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

List<MenuCategories> parseMenuCategories(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<MenuCategories>((json) => MenuCategories.fromJson(json))
      .toList();
}
