part of '../../../controller/_controller.dart';

class CheckoutPageController extends GetxController {
  final cart = Get.put(CartController());
  final order = Get.put(OrderController());

  void backOnClick() {
    Get.back();
  }
}
