part of 'helpers.dart';

class OrderHelper {
  BuildContext _context;

  OrderHelper(this._context);

  void makeOrder() async {
    final provider = Provider.of<CartProvider>(_context, listen: false);

    final order = Order(
      restaurantTableId: 1,
      totalPrice: provider.getTotalPrice(),
      orderItems: provider.items,
    );

    if (isOrderNull() && !await postOrder(order, _context)) {
      Popup(_context).showFailedPopup();
    }
    Popup(_context).showSuccessPopup();
  }

  bool isOrderNull() {
    final provider = Provider.of<OrderProvider>(_context, listen: false);
    return provider.getCurrentOrder == null;
  }

  void orderSuccess(response) {
    final data = jsonDecode(response)['data'];
    final finalResponse = OrderResponse.fromJson(data);
    final provider = Provider.of<OrderProvider>(_context, listen: false);
    provider.setCurrentOrder = finalResponse;
    print('ORDER SUCCESSFULLY CREATED');

    // final cart = Provider.of<CartProvider>(_context, listen: false);
    // cart.items=[];
  }
}
