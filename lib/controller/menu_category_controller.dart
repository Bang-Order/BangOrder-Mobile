part of '_controller.dart';

class MenuCategoryController extends GetxController {
  late List<MenuCategory> _data;

  Future<void> callApi() async {
    data = await MenuCategoryServices.getMenuCategory();
  }

  bool isNotEmpty() {
    return data.isNotEmpty;
  }

  MenuCategory getMenuCategoryByIndex(int index) => data[index];

  MenuCategory getMenuCategoryById(MenuCategory menuCategory) {
    int id = data.indexWhere((element) => element.id == menuCategory.id);
    return data.elementAt(id);
  }

  List<MenuCategory> get data => _data;

  set data(List<MenuCategory> value) {
    _data = value;
    update();
  }
}
