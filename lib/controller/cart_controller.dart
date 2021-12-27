part of '_controller.dart';

class CartController extends GetxController {
  var items = <Menu>[].obs;

  void addItem(Menu cart) {
    items.add(cart);
    update();
  }

  void deleteItem(int id) {
    items.removeWhere((element) => element.id == id);
    update();
  }

  void updateItem(Menu data, Menu updatedData) {
    Menu menu = getItemById(data);
    menu = updatedData;
    update();
  }

  double getTotalPrice() {
    double total = 0;
    items.forEach((element) {
      total += double.parse(element.price) * element.quantity;
    });
    return total;
  }

  bool isContainData(Menu data) {
    bool isContain = false;
    items.forEach((element) {
      if (element.id == data.id) {
        isContain = true;
      }
    });
    return isContain;
  }

  int getQuantity(Menu menu) {
    return getItemById(menu).quantity;
  }

  Menu getItemById(Menu menu) {
    int index = items.indexWhere((element) => element.id == menu.id);
    return items.elementAt(index);
  }

  // List<Menu> get items => _items;
  //
  // set items(List<Menu> value) {
  //   _items = value;
  //   update();
  // }
}
