part of 'providers.dart';

class MenuCategoryServiceProvider with ChangeNotifier {
  late List<MenuCategory> _data;
  bool _loading = true;

  void init() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      loading = true;
      _data = await getMenuCategory();
      loading = false;
    });
  }

  List<MenuCategory> get data => _data;

  MenuCategory getMenuCategoryByIndex(int index) => data[index];

  MenuCategory getMenuCategoryById(MenuCategory menuCategory) {
    int id = data.indexWhere((element) => element.id == menuCategory.id);
    return data.elementAt(id);
  }

  set data(List<MenuCategory> value) {
    _data = value;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}