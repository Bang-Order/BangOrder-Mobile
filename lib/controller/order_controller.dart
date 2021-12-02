part of '_controller.dart';

class OrderController extends GetxController {
  OrderResponse? _orderResponse;

  void makeOrder(context) async {
    final provider = Get.put(CartController());

    final order = Order(
      restaurantTableId: 1,
      totalPrice: provider.getTotalPrice(),
      orderItems: provider.items,
    );

    if (isOrderNull() && !await OrderServices.postOrder(order)) {
      Popup(context).showFailedPopup();
    } else {
      Popup(context).showSuccessPopup();
    }
  }

  void orderSuccess(OrderResponse response) {
    final order = Get.put(OrderController());
    order.setOrderResponse = response;
    HistoryHelper.insertOrder(
      response,
      Get.put(RestaurantController()).getData!,
    );
    print('ORDER SUCCESSFULLY CREATED');

    final cart = Get.put(CartController());
    cart.items = [];
  }

  bool isOrderNull() {
    return getOrderResponse == null;
  }

  OrderResponse? get getOrderResponse => _orderResponse;

  set setOrderResponse(OrderResponse? value) {
    _orderResponse = value;
    update();
  }
}
