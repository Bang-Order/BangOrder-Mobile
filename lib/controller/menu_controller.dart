part of '_controller.dart';

class MenuController extends GetxController {
  late List<Menu> _data;

  Future<void> callApi() async {
    data = await MenuServices.getMenu();
  }

  bool isNotEmpty() {
    return data.isNotEmpty;
  }

  bool isMenuCategoryEmpty() {
    for (Menu item in data) {
      if (item.categoryId == null) {
        print('EMPTY');
        return true;
      }
    }
    return false;
  }

  List<Menu> getMenuByCategoryId(MenuCategory menuCategory) {
    return data.where((element) {
      return element.categoryId == menuCategory.id;
    }).toList();
  }

  List<Menu> getMenuByNullMenuCategory() {
    return data.where((element) {
      return element.categoryId == null;
    }).toList();
  }

  List<Menu> get getRecommendationMenu {
    return data.where((element) => element.isRecommended == 1).toList();
  }

  List<Menu> get data => _data;

  set data(List<Menu> value) {
    _data = value;
    update();
  }
}
