part of '_services.dart';

class OrderServices {
  static Future postOrder(Order order) async {
    final provider = Get.put(BarcodeController());
    final response = await http.post(
      Uri.parse(BaseURL + 'restaurants/${provider.getData!.restaurantId}/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(order.toJson(order)),
    );
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body)['data'];
      final finalResponse = OrderResponse.fromJson(data);
      Get.put(OrderController()).orderSuccess(finalResponse);
      return true;
    } else {
      return false;
    }
  }

  static Future<List<OrderHistory>> getOrderHistory(
      List<String> orderId) async {
    orderId.forEach((element) {
      print('element: ' + element);
    });
    final queryParameters = {
      'order_id': orderId,
    };
    final uri = Uri.http('192.168.0.7',
        '/BangOrder-Backend/public/api/orders/history/', queryParameters);
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.get(uri, headers: headers);

    // final url = Uri.parse(BaseURL + 'orders/history');
    // final newURI = url.replace(queryParameters: body);
    //
    // final response = await http.get(
    //   newURI,
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // );
    // print('DATA ORDER SERCIVES: ' + response.body);
    if (response.statusCode == 200) {
      print('SUCCESS');

      return orderHistoryFromJson(response.body);
    } else {
      print('FAILED');
      return [];
    }
  }
}
