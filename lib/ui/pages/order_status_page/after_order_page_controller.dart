part of '../../../controller/_controller.dart';

class AfterOrderPageController extends GetxController {
  late OrderHistory orderHistory;

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

  DatabaseReference get getReference {
    return FirebaseDatabase(databaseURL: getURL)
        .reference()
        .child("orders")
        .child(orderHistory.restaurantId.toString())
        .child(orderHistory.id.toString())
        .child('order_status');
  }

  bool isTrue(AsyncSnapshot<dynamic> snapshot) {
    return snapshot.hasData &&
        !snapshot.hasError &&
        snapshot.data.snapshot.value != null;
  }

  String get getURL {
    return 'https://bangorder-db7d2-default-rtdb.asia-southeast1.firebasedatabase.app';
  }
}
