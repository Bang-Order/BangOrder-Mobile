part of '_controller.dart';

class OrderController extends GetxController {
  OrderHistory? _orderResponse;

  Future<bool> makeOrder() async {
    final cart = Get.put(CartController());
    final barcode = Get.put(BarcodeController());

    final order = Order(
      restaurantTableId: int.parse(barcode.getData!.restaurantTableId),
      totalPrice: cart.getTotalPrice(),
      orderItems: cart.items,
    );

    if (isOrderNull() && !await OrderServices.postOrder(order)) {
      return false;
      // Popup(context).showFailedPopup();
    } else {
      return true;
      // Popup(context).showSuccessPopup();
    }
  }

  void orderSuccess(OrderHistory response) {
    final order = Get.put(OrderController());
    order.setOrderResponse = response;
    DatabaseOrderHistory.insertOrder(response);
    print('ORDER SUCCESSFULLY CREATED');
  }

  bool isOrderNull() {
    return getOrderResponse == null;
  }

  OrderHistory? get getOrderResponse => _orderResponse;

  set setOrderResponse(OrderHistory? value) {
    _orderResponse = value;
    update();
  }
}
