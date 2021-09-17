part of 'services.dart';

Future<List> fetchMenuItems(category) async {
  final url = APIURL + 'category-menu?category=' + category;
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse;
  } else {
    throw Exception('Failed to load data');
  }
}
