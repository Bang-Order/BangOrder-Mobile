part of '_services.dart';

class RestaurantServices {
  static Future<Restaurant> getRestaurantInfo() async {
    final barcode = Get.put(BarcodeController());
    final url = BaseURL +
        'restaurants/' +
        barcode.getData!.restaurantId +
        '/tables/' +
        barcode.getData!.restaurantTableId;
    print('restaurantId: ' + barcode.getData!.restaurantId.toString());
    print(
        'restaurantTableId: ' + barcode.getData!.restaurantTableId.toString());

    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print('RESTAURANT INFOOO' + response.body);
      return parseRestaurant(response.body);
    } else {
      throw Exception('Failed to load data ' + response.statusCode.toString());
    }
  }
}
