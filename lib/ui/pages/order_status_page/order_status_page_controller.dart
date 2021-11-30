part of '../../../controller/_controller.dart';

class OrderStatusPageController extends GetxController {
  late final OrderResponse orderResponse;

  @override
  void onInit() {
    final orderController = Get.put(OrderController());
    orderResponse = orderController.getOrderResponse!;
    super.onInit();
  }

  @override
  void dispose() {
    Get.delete<OrderStatusPageController>();
    super.dispose();
  }

  void backOnClick() {
    Get.offAll(HomePage());
  }

  String getTotalPrice() {
    return orderResponse.totalPrice;
  }

  List<Menu>? getOrderedMenu() {
    return orderResponse.orderItems;
  }

  String getInvoiceURL() {
    return orderResponse.invoiceUrl;
  }

  DatabaseReference get getReference {
    final barcode = Get.put(BarcodeController());
    print('barcode.data.restaurantId: ' + barcode.data.restaurantId);
    print('order.getOrderResponse!.id: ' + orderResponse.id.toString());

    return FirebaseDatabase(databaseURL: getURL)
        .reference()
        .child("orders")
        .child(barcode.data.restaurantId)
        .child(orderResponse.id.toString())
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
