part of 'providers.dart';

class OrderProvider with ChangeNotifier {
  OrderResponse? _currentOrder;

  OrderResponse? get getCurrentOrder => _currentOrder;

  set setCurrentOrder(OrderResponse value) {
    _currentOrder = value;
    notifyListeners();
  }
}
