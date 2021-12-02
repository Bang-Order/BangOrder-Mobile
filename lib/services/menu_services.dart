part of 'services.dart';

class MenuServices {
  static Future<List<Menu>> getMenu() async {
    final provider = Get.put(BarcodeController());
    final url =
        BaseURL + 'restaurants/' + provider.getData!.restaurantId + '/menus';
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("MENUUU: " + response.body);
      return _parseMenus(response.body);
    } else {
      throw Exception('Failed to load data ' + response.statusCode.toString());
    }
  }

  static List<Menu> _parseMenus(String responseBody) {
    return List<Menu>.from(
      json.decode(responseBody)['data'].map((x) => Menu.fromJson(x)),
    );
  }
}
