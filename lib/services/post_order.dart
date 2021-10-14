part of 'services.dart';

Future postOrder({restoId, totalPrice, items}) async {
  final url = APIURL + 'restaurants/1/orders';

  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'restaurant_table_id': restoId,
      'total_price': totalPrice,
      'order_items': items
          .map((Menu menu) => menu.toJson(id: menu.id, quantity: menu.quantity))
          .toList()
    }),
  );

  if (response.statusCode == 201) {
    print("success");
  } else {
    throw Exception('Failed to create album.');
  }
}
