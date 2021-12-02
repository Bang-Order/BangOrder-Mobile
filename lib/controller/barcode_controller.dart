part of '_controller.dart';

class BarcodeController extends GetxController {
  late BarcodeModel _data;

  BarcodeModel? get getData => _data;

  void setDataFromDeeplink(deepLink) {
    BarcodeModel barcodeModel = new BarcodeModel(
      restaurantId: deepLink.queryParameters.values.first,
      restaurantTableId: deepLink.queryParameters.values.last,
    );
    setData = barcodeModel;
  }

  bool isNull() {
    return getData != null;
  }

  set setData(BarcodeModel value) {
    _data = value;
    update();
  }
}
