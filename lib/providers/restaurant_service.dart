part of 'providers.dart';

class RestaurantServiceProvider with ChangeNotifier {
  late RestaurantInfo _data;
  bool _loading = true;

  void init() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      loading = true;
      _data = await getRestaurantInfo();
      loading = false;
    });
  }

  RestaurantInfo get data => _data;

  set data(RestaurantInfo value) {
    _data = value;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
