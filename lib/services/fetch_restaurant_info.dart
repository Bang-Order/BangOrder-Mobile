part of 'services.dart';

Future <RestaurantInfo> fetchRestaurantInfo() async {
  final url = APIURL + 'restaurants/2';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return RestaurantInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data'+ response.statusCode.toString());
  }
}