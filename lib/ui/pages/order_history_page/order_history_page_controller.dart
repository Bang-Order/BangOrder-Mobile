part of '../../../controller/_controller.dart';

class OrderHistoryPageController extends GetxController {
  bool _isLoading = true;
  List<OrderHistory> orderHistory = [];

  @override
  void onInit() async {
    isLoading = true;
    orderHistory = await OrderServices.getOrderHistory(await getOrderId());
    isLoading = false;
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

  String decisionLogoPaymentMethod(String? paymentMethod) {
    if (paymentMethod == "LinkAja") {
      return "assets/images/icon_linkaja.png";
    } else if (paymentMethod == "ShopeePay") {
      return "assets/images/icon_shopeepay.png";
    } else if (paymentMethod == "DANA") {
      return "assets/images/icon_dana.png";
    } else if (paymentMethod == "OVO") {
      return "assets/images/icon_ovo.png";
    } else {
      return "assets/images/icon_qris.png";
    }
  }

  void deleteHistory(int id) {
    DatabaseOrderHistory.deleteOrder(id);
    orderHistory.removeWhere((element) => element.id == id);
    update();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}
