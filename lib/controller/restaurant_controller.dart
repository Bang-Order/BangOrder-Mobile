part of '_controller.dart';

class RestaurantController extends GetxController {
  Restaurant? _data;

  Future<void> callApi() async {
    setData = await RestaurantServices.getRestaurantInfo();
  }

  bool isNull() {
    return getData != null;
  }

  Restaurant? get getData => _data;

  set setData(Restaurant value) {
    _data = value;
    update();
  }
}
