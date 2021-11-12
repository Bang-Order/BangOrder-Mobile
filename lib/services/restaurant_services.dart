part of 'services.dart';

class RestaurantServices {
  BuildContext _context;

  RestaurantServices(this._context);

  Future<Restaurant> getRestaurantInfo() async {
    final provider = Provider.of<BarcodeProvider>(_context, listen: false);
    final url = BaseURL +
        'restaurants/' +
        provider.data.restaurantId +
        '/tables/' +
        provider.data.restaurantTableId;
    print('restaurantId: ' + provider.data.restaurantId.toString());
    print('restaurantTableId: ' + provider.data.restaurantTableId.toString());

    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);

    if (response.statusCode == 200) {
      print(response.body);
      return _parse(response.body);
    } else {
      throw Exception('Failed to load data ' + response.statusCode.toString());
    }
  }

  Restaurant _parse(data) => Restaurant.fromJson(jsonDecode(data));
}
