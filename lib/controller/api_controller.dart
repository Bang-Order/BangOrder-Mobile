part of '_controller.dart';

class ApiController extends GetxController {
  bool _isLoading = true;

  final restaurant = Get.put(RestaurantController());
  final menuCategory = Get.put(MenuCategoryController());
  final menu = Get.put(MenuController());

  Future<void> callApi() async {
    isLoading = true;
    await restaurant.callApi();
    await menuCategory.callApi();
    await menu.callApi();
    isLoading = false;
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }
}
