part of 'services.dart';

Future<List<Menu>> getMenu(context) async {
  final provider = Provider.of<BarcodeProvider>(context, listen: false);
  final url = APIURL + 'restaurants/' + provider.data.restaurantId + '/menus';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseMenus(response.body);
  } else {
    throw Exception('Failed to load data' + response.statusCode.toString());
  }
}

List<Menu> parseMenus(String responseBody) {
  return List<Menu>.from(
      json.decode(responseBody)['data'].map((x) => Menu.fromJson(x)));
}
