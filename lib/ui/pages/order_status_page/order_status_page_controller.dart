part of '../../../controller/_controller.dart';

class OrderStatusPageController extends GetxController {
  final orderController = Get.put(OrderController());

  void backOnClick() {
    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(
    //     builder: (context) => RestaurantHomePage(),
    //   ),
    //   (route) => false,
    // );
    Get.offAll(HomePage());
  }

  String getTotalPrice() {
    return orderController.getOrderResponse!.totalPrice;
  }

  List<Menu>? getOrderedMenu() {
    return orderController.getOrderResponse!.orderItems;
  }

  String getInvoiceURL(){
    return orderController.getOrderResponse!.invoiceUrl;
  }

  DatabaseReference get getReference {
    final barcode = Get.put(BarcodeController());
    print('barcode.data.restaurantId: ' + barcode.data.restaurantId);
    print('order.getOrderResponse!.id: ' +
        orderController.getOrderResponse!.id.toString());

    return FirebaseDatabase(databaseURL: getURL)
        .reference()
        .child("orders")
        .child(barcode.data.restaurantId)
        .child(orderController.getOrderResponse!.id.toString())
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
