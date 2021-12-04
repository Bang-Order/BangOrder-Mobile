part of '_services.dart';

class OrderServices {
  static Future postOrder(Order order) async {
    final provider = Get.put(BarcodeController());
    final response = await http.post(
      Uri.parse(
          BaseURL + 'restaurants/${provider.getData!.restaurantId}/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(order.toJson(order)),
    );
    if (response.statusCode == 201) {
      final orderResponse = orderHistoryFromJson2(response.body);
      Get.put(OrderController()).orderSuccess(orderResponse);

      return true;
    } else {
      return false;
    }
  }

  static Future<List<OrderHistory>> getOrderHistory(
      List<String> orderId) async {
    print(jsonEncode({"order_id": orderId}));
    final response = await http.post(
      Uri.parse(
          'http://192.168.0.7/BangOrder-Backend/public/api/orders/history'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"order_id": orderId}),
    );

    if (response.statusCode == 200) {
      print('SUCCESS');
      return orderHistoryFromJson(response.body);
    } else {
      print('FAILED ${response.statusCode}');
      return [];
    }
  }
}
