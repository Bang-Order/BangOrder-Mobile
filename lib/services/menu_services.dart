part of 'services.dart';

class MenuServices {
  BuildContext _context;

  MenuServices(this._context);

  Future<List<Menu>> getMenu() async {
    final provider = Provider.of<BarcodeProvider>(_context, listen: false);
    final url = BaseURL + provider.data.restaurantId + '/menus';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print("MENUUU: "+ response.body);
      return _parseMenus(response.body);
    } else {
      throw Exception('Failed to load data' + response.statusCode.toString());
    }
  }

  List<Menu> _parseMenus(String responseBody) {
    return List<Menu>.from(
      json.decode(responseBody)['data'].map((x) => Menu.fromJson(x)),
    );
  }
}
