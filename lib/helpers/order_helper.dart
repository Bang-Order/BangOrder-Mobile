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

    if (isOrderNull() && !await OrderServices(_context).postOrder(order)) {
      Popup(_context).showFailedPopup();
    } else {
      Popup(_context).showSuccessPopup();
    }
  }

  bool isOrderNull() {
    final provider = Provider.of<OrderProvider>(_context, listen: false);
    return provider.getCurrentOrder == null;
  }

  void orderSuccess(OrderResponse response) {
    final orderProvider = Provider.of<OrderProvider>(_context, listen: false);
    orderProvider.setCurrentOrder = response;
    HistoryHelper.insertOrder(
      response,
      Provider.of<RestaurantServiceProvider>(_context, listen: false).data,
    );
    print('ORDER SUCCESSFULLY CREATED');

    // final cart = Provider.of<CartProvider>(_context, listen: false);
    // cart.items=[];
  }
}
