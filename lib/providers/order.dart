part of 'providers.dart';

class OrderProvider with ChangeNotifier {
  OrderResponse? _currentOrder;

  // void makeOrder(context) async {
  //   final provider = Provider.of<CartProvider>(context, listen: false);
  //
  //   final order = Order(
  //     restaurantTableId: 1,
  //     totalPrice: provider.getTotalPrice(),
  //     orderItems: provider.items,
  //   );
  //
  //   if (isOrderNull() && !await postOrder(order, context)) {
  //     Popup(context).showFailedPopup();
  //   }
  //   Popup(context).showSuccessPopup();
  // }
  //
  // bool isOrderNull() => getCurrentOrder == null;

  OrderResponse? get getCurrentOrder => _currentOrder;

  set setCurrentOrder(OrderResponse value) {
    _currentOrder = value;
    notifyListeners();
  }
}
