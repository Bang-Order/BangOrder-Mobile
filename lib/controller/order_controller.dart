part of '_controller.dart';

class OrderController extends GetxController {
  OrderHistory? _orderResponse;

  void makeOrder(context) async {
    final provider = Get.put(CartController());

    final order = Order(
      restaurantTableId:
          int.parse(Get.put(BarcodeController()).getData!.restaurantId),
      totalPrice: provider.getTotalPrice(),
      orderItems: provider.items,
    );

    if (isOrderNull() && !await OrderServices.postOrder(order)) {
      Popup(context).showFailedPopup();
    } else {
      Popup(context).showSuccessPopup();
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
