part of 'services.dart';

Future<List<MenuCategory>> getMenuCategory(context) async {
  final provider = Provider.of<BarcodeProvider>(context, listen: false);
  final url = APIURL + 'restaurants/' + provider.data.restaurantId + '/menu-categories';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseMenuCategories(response.body);
  } else {
    throw Exception('Failed to load data' + response.statusCode.toString());
  }
}

List<MenuCategory> parseMenuCategories(String responseBody) {
  return List<MenuCategory>.from(
      json.decode(responseBody)['data'].map((x) => MenuCategory.fromJson(x)));
}
