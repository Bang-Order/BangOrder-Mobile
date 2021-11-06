part of 'services.dart';

Future<Restaurant> getRestaurantInfo(context) async {
  final provider = Provider.of<BarcodeProvider>(context, listen: false);
  print("isi restaurant_id: " + provider.data.restaurantId);
  print("isi restaurant_table_id: " + provider.data.restaurantTableId);
  final url = APIURL + 'restaurants/' + provider.data.restaurantId + '/tables/' + provider.data.restaurantTableId;
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    print(response.body);
    return Restaurant.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data ' + response.statusCode.toString());
  }
}
