part of '../../../controller/_controller.dart';

class OrderHistoryPageController extends GetxController {
  late List<OrderHistory> orderHistory;

  @override
  void onInit() async {
    orderHistory = await OrderServices.getOrderHistory(await getOrderId());
    orderHistory.forEach((element) {
      print('element.id: ' + element.id.toString());
    });
    super.onInit();
  }

  Future<List<String>> getOrderId() async {
    List<OrderResponse> getOrder = await DatabaseOrderHistory.getAllOrder();
    List<String> orderId = [];

    getOrder.forEach((element) {
      orderId.add(element.id.toString());
    });

    return orderId;
  }
}
