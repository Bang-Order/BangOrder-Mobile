part of 'services.dart';

class MenuCategoryServices {
  BuildContext _context;

  MenuCategoryServices(this._context);

  Future<List<MenuCategory>> getMenuCategory() async {
    final provider = Provider.of<BarcodeProvider>(_context, listen: false);
    final url = BaseURL +
        'restaurants/' +
        provider.data.restaurantId +
        '/menu-categories';
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return _parseMenuCategories(response.body);
    } else {
      throw Exception('Failed to load data' + response.statusCode.toString());
    }
  }

  List<MenuCategory> _parseMenuCategories(String responseBody) {
    return List<MenuCategory>.from(
        json.decode(responseBody)['data'].map((x) => MenuCategory.fromJson(x)));
  }
}
