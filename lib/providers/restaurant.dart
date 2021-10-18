part of 'providers.dart';

class RestaurantInfoProvider with ChangeNotifier {
  RestaurantInfo _restaurant = RestaurantInfo(
      id: 0, name: '', image: '', email: '', phoneNumber: '', address: '');

  RestaurantInfo get restaurant => _restaurant;

  set restaurant(RestaurantInfo value) {
    _restaurant = value;
    notifyListeners();
  }
}
