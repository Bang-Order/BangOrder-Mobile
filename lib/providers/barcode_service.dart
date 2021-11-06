part of 'providers.dart';

class BarcodeProvider with ChangeNotifier {
  late BarcodeModel _data;

  BarcodeModel get data => _data;

  set data(BarcodeModel value) {
    _data = value;
    notifyListeners();
  }

}