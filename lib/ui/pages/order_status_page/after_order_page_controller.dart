part of '../../../controller/_controller.dart';

class AfterOrderPageController extends GetxController {
  late bool isPaid;
  late OrderHistory orderHistory;
  String _paymentMethod = '';

  void goToPage({required orderHistory}) {
    this.orderHistory = orderHistory;
    update();

    Get.to(AfterOrderPage());
  }

  @override
  void dispose() {
    Get.delete<AfterOrderPageController>();
    super.dispose();
  }

  void backOnClick() {
    Get.offAll(LandingPage());
  }

  String getTotalPrice() {
    return orderHistory.totalPrice;
  }

  List<OrderItem>? getOrderedMenu() {
    return orderHistory.orderItems;
  }

  DatabaseReference get getOrderStatus {
    return FirebaseDatabase(databaseURL: getURL)
        .reference()
        .child("orders")
        .child(orderHistory.restaurantId.toString())
        .child(orderHistory.id.toString())
        .child('order_status');
  }

  DatabaseReference get getPaymentMethod {
    return FirebaseDatabase(databaseURL: getURL)
        .reference()
        .child("orders")
        .child(orderHistory.restaurantId.toString())
        .child(orderHistory.id.toString())
        .child('payment_method');
  }

  bool isTrue(AsyncSnapshot<dynamic> snapshot) {
    return snapshot.hasData &&
        !snapshot.hasError &&
        snapshot.data.snapshot.value != null;
  }

  String get getURL {
    return 'https://bangorder-db7d2-default-rtdb.asia-southeast1.firebasedatabase.app';
  }
  String get paymentMethod => _paymentMethod;

  set paymentMethod(String value) {
    _paymentMethod = value;
    update();
  }

}
