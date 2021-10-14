part of 'providers.dart';

class CartProvider with ChangeNotifier {
  late List<Menu> _items = [];

  List<Menu> get items => _items;

  set items(List<Menu> value) {
    _items = value;
    notifyListeners();
  }

  void addItem(Menu cart) {
    items.add(cart);
    notifyListeners();
  }

  void deleteItem(int id) {
    items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void updateItem(int id, Menu cart) {
    int index = items.indexWhere((element) => element.id == id);
    items[index] = cart;
    notifyListeners();
  }

  int getTotalPrice() {
    int total = 0;
    items.forEach((element) {
      total += element.price * element.quantity;
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

  int getQuantity(Menu data) {
    int index = items.indexWhere((element) => element.id == data.id);
    return items.elementAt(index).quantity;
  }
}
