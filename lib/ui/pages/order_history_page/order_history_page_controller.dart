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

  String decisionLogoPaymentMethod(String paymentMethod) {
    if (paymentMethod == "LinkAja") {
      return "assets/images/linkaja_logo.png";
    } else if (paymentMethod == "ShopeePay") {
      return "assets/images/shopeepay_logo.png";
    } else if (paymentMethod == "DANA") {
      return "assets/images/dana_logo.png";
    } else if (paymentMethod == "OVO") {
      return "assets/images/icon_ovo.png";
    } else {
      return "assets/images/qris_logo.png";
    }
  }
}
