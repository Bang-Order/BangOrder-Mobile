part of 'services.dart';

Future postOrder(Order order, context) async {
  final response = await http.post(
    Uri.parse(APIURL + 'restaurants/1/orders'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(order.toJson(order)),
  );
  if (response.statusCode == 201) {
    OrderHelper(context).orderSuccess(response.body);
    return true;
  } else {
    return false;
  }
}
