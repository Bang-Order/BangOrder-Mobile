part of '../../../controller/_controller.dart';

class OrderHistoryPageController extends GetxController {
  List<OrderHistory> orderHistory = [];

  @override
  void onInit() async {
    orderHistory = await OrderServices.getOrderHistory(await getOrderId());
    update();
    super.onInit();
  }

  Future<List<String>> getOrderId() async {
    List<int> getOrder = await DatabaseOrderHistory.getAllOrder();
    List<String> orderId = [];

    getOrder.forEach((element) {
      orderId.add(element.toString());
    });

    return orderId;
  }
}
