part of '_controller.dart';

class BarcodeController extends GetxController {
  BarcodeModel _data = BarcodeModel(restaurantTableId: '1', restaurantId: '1');

  BarcodeModel get data => _data;

  set data(BarcodeModel value) {
    _data = value;
    update();
  }
}
