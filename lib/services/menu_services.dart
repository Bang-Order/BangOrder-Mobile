part of '_services.dart';

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
      return parseMenus(response.body);
    } else {
      throw Exception('Failed to load data ' + response.statusCode.toString());
    }
  }
}
