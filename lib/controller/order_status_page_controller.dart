part of '_controller.dart';

class OrderStatusPageController extends GetxController {
  void backOnClick() {
    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(
    //     builder: (context) => RestaurantHomePage(),
    //   ),
    //   (route) => false,
    // );
    Get.back();
  }

  DatabaseReference get getReference {
    return FirebaseDatabase(databaseURL: getURL)
        .reference()
        .child("orders")
        .child('1')
        .child('6')
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
