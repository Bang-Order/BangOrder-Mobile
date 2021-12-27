part of '../../../controller/_controller.dart';

class CheckoutPageController extends GetxController {
  final cart = Get.put(CartController());
  final order = Get.put(OrderController());

  bool _isLoading = false;

  @override
  void onInit() {
    super.onInit();
    ever(cart.items, (_) {
      if (cart.items.isEmpty) {
        Get.back();
      }
    });
  }

  void backOnClick() {
    Get.back();
  }

  void yesOnClick(BuildContext context) async {
    isLoading = true;

    if (await order.makeOrder()) {
      Get.put(AfterOrderPageController()).goToPage(
        orderHistory: Get.put(OrderController()).getOrderResponse,
      );

      final cart = Get.put(CartController());
      cart.items = <Menu>[].obs;
    } else {
      Get.back();
      Popup(context).showFailedPopup();
    }
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}
