part of 'providers.dart';

class DetailPageProvider extends ChangeNotifier {
  late Menu _menu;
  late PageEnum _previousPage;
  late bool _isUpdate = false;
  late int _initQuantity;
  late String _initNotes;

  void init({
    required Menu menu,
    required PageEnum previousPage,
    required context,
  }) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    if (cart.isContainData(menu)) {
      this.menu = cart.getItemById(menu);
      isUpdate = true;
      initQuantity = this.menu.quantity;
      initNotes = this.menu.notes.text;
    } else {
      this.menu = menu;
    }
    this.previousPage = previousPage;
  }

  void incrementQuantity() {
    menu.quantity += 1;
    notifyListeners();
  }

  void decrementQuantity() {
    menu.quantity -= 1;
    notifyListeners();
  }

  void pop(context) {
    switch (previousPage) {
      case PageEnum.HomePage:
        Navigator.pop(context);
        break;
      case PageEnum.SearchPage:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => RestaurantHomePage()),
            (route) => false);
        break;
      case PageEnum.CheckoutPage:
        Navigator.pop(context);
        break;
      case PageEnum.DetailPage:
        break;
    }
  }

  void exit() {
    if (isUpdate) {
      menu.quantity = initQuantity;
      menu.notes.text = initNotes;
    } else {
      menu.quantity = 0;
      menu.notes = TextEditingController();
    }
    if (_menu.quantity == 0) _menu.quantity = 1;
    print('exit');
  }

////////////////////////////////////////////////////////////////////////////////

  PageEnum get previousPage => _previousPage;

  set previousPage(PageEnum value) {
    _previousPage = value;
    notifyListeners();
  }

  bool get isUpdate => _isUpdate;

  set isUpdate(bool value) {
    _isUpdate = value;
    notifyListeners();
  }

  String get initNotes => _initNotes;

  set initNotes(String value) {
    _initNotes = value;
    notifyListeners();
  }

  int get initQuantity => _initQuantity;

  set initQuantity(int value) {
    _initQuantity = value;
    notifyListeners();
  }

  Menu get menu => _menu;

  set menu(Menu value) {
    _menu = value;
    notifyListeners();
  }
}
