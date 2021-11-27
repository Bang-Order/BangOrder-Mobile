part of '_controller.dart';

class OrderController extends GetxController {
  OrderResponse? _orderResponse;

  OrderResponse? get getOrderResponse => _orderResponse;

  set setOrderResponse(OrderResponse value) {
    _orderResponse = value;
    update();
  }
}
