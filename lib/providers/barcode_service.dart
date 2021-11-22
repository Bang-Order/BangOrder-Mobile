part of 'providers.dart';

class BarcodeProvider with ChangeNotifier {
  // late BarcodeModel _data;
  BarcodeModel _data = BarcodeModel(restaurantTableId: '1', restaurantId: '1');

  BarcodeModel get data => _data;

  set data(BarcodeModel value) {
    _data = value;
    notifyListeners();
  }
}