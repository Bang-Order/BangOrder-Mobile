part of 'services.dart';

Future<RestaurantInfo> getRestaurantInfo() async {
  final url = APIURL + 'restaurants/1';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return RestaurantInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data' + response.statusCode.toString());
  }
}
