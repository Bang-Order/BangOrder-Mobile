part of 'providers.dart';

class MenuServiceProvider extends ChangeNotifier {
  late List<Menu> _data;
  bool _loading = true;

  void init(context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      loading = true;
      _data = await MenuServices(context).getMenu();
      loading = false;
    });
  }

  List<Menu> get data => _data;

  List<Menu> getMenuByCategoryId(MenuCategory menuCategory) {
    return data
        .where((element) => element.categoryId == menuCategory.id)
        .toList();
  }

  List<Menu> get getRecommendationMenu {
    return data.where((element) => element.isRecommended == 1).toList();
  }

  set data(List<Menu> value) {
    _data = value;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
