part of 'providers.dart';

class CartProvider with ChangeNotifier {
  late List<Cart> _item = [];

  List<Cart> get item => _item;

  set item(List<Cart> value) {
    _item = value;
    notifyListeners();
  }

  void addItem(Cart cart) {
    item.add(cart);
    notifyListeners();
  }

  void deleteItem(int id) {
    item.removeWhere((element) => element.menuId == id);
    notifyListeners();
  }

  void updateItem(int id, Cart cart) {
    int index = item.indexWhere((element) => element.menuId == id);
    item[index] = cart;
    notifyListeners();
  }

  int getTotalPrice() {
    int total = 0;
    item.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }

  bool isContainData(Menu data) {
    bool isContain = false;
    item.forEach((element) {
      if (element.menuId == data.id) {
        isContain = true;
      }
    });
    return isContain;
  }

  int getQuantity(Menu data) {
    int index = item.indexWhere((element) => element.menuId == data.id);
    return item.elementAt(index).quantity;
  }
}
