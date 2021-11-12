part of 'services.dart';

class OrderServices {
  BuildContext _context;

  OrderServices(this._context);

  Future postOrder(Order order) async {
    final provider = Provider.of<BarcodeProvider>(_context, listen: false);
    final response = await http.post(
      Uri.parse(BaseURL + 'restaurants/${provider.data.restaurantId}/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(order.toJson(order)),
    );
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body)['data'];
      final finalResponse = OrderResponse.fromJson(data);
      OrderHelper(_context).orderSuccess(finalResponse);
      return true;
    } else {
      return false;
    }
  }
}
