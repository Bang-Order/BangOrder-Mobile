part of 'providers.dart';

class RestaurantServiceProvider with ChangeNotifier {
  late Restaurant _data;
  bool _loading = true;

  void init(context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      loading = true;
      _data = await getRestaurantInfo(context);
      loading = false;
    });
  }

  Restaurant get data => _data;

  set data(Restaurant value) {
    _data = value;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
