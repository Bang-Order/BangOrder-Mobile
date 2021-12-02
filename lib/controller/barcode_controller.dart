part of '_controller.dart';

class BarcodeController extends GetxController {
  // late BarcodeModel _data;
  BarcodeModel? _data = BarcodeModel(restaurantTableId: '1', restaurantId: '1');

  BarcodeModel? get getData => _data;

  bool isNull() {
    return getData != null;
  }

  set setData(BarcodeModel value) {
    _data = value;
    update();
  }
}
