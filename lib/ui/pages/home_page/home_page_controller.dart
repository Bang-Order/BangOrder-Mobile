part of '../../../controller/_controller.dart';

class HomePageController extends GetxController {
  bool _isLoading = true;
  final restaurant = Get.put(RestaurantController());
  final menuCategory = Get.put(MenuCategoryController());
  final menu = Get.put(MenuController());
  final barcode = Get.put(BarcodeController());

  @override
  void onInit() async {
    isLoading = true;
    await restaurant.callApi();
    await menuCategory.callApi();
    await menu.callApi();
    isLoading = false;
    super.onInit();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}
