part of 'providers.dart';

class InfoRestaurantProvider with ChangeNotifier {
  String _restaurantName = '';

  String get restaurantName => _restaurantName;

  set restaurantName(String value) {
    _restaurantName = value;
    notifyListeners();
  }
}