part of 'services.dart';

Future postOrder(Order order) async {
  final url = APIURL + 'restaurants/1/orders';

  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'restaurant_table_id': order.restaurantTableId,
      'total_price': order.totalPrice,
      'order_items':
          order.orderItems.map((Menu menu) => menu.toJson(menu)).toList()
    }),
  );

  if (response.statusCode == 201) {
    print("Success!");
  } else {
    throw Exception('Failed!');
  }
}
