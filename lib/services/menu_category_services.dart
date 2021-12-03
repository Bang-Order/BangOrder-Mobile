part of '_services.dart';

class MenuCategoryServices {
  static Future<List<MenuCategory>> getMenuCategory() async {
    final provider = Get.put(BarcodeController());
    final url = BaseURL +
        'restaurants/' +
        provider.getData!.restaurantId +
        '/menu-categories';
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("MENUCATEGORYYY: " + response.body);
      return parseMenuCategories(response.body);
    } else {
      throw Exception('Failed to load data' + response.statusCode.toString());
    }
  }
}
