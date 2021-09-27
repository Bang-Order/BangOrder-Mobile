part of 'services.dart';

Future<Map<String, dynamic>> get fetchHomePage async {
  final url = APIURL + 'menu-category?restaurant_id=1';
  final response = await http.get(Uri.parse(url));
  Map<String, dynamic> responseMap = jsonDecode(response.body)['data'];

  if (response.statusCode == 200) {
    return responseMap;
  } else {
    throw Exception('Failed to load data');
  }
}
