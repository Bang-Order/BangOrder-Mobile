part of '../../../controller/_controller.dart';

class DetailMenuPageController extends GetxController {
  final cart = Get.put(CartController());
  late Menu _menu;
  late PageEnum _previousPage;
  late bool _isUpdate = false;
  late int _initQuantity;
  late String _initNotes;

  void constructor({required Menu menu, required PageEnum previousPage}) {
    if (cart.isContainData(menu)) {
      this.menu = cart.getItemById(menu);
      isUpdate = true;
      initQuantity = this.menu.quantity;
      initNotes = this.menu.notes.text;
    } else {
      isUpdate = false;
      this.menu = menu;
      this.menu.quantity = 1;
    }
    this.previousPage = previousPage;

    Get.to(DetailMenuPage());
  }

  void incrementQuantity() {
    menu.quantity += 1;
    update();
  }

  void decrementQuantity() {
    menu.quantity -= 1;
    update();
  }

  double pricing() {
    return double.parse(menu.price) * menu.quantity;
  }

  void removeMenuInCart(context) {
    cart.deleteItem(menu.id);
    update();
    pop(context);
  }

  void updateMenuInCart(context) {
    cart.updateItem(menu, menu);
    update();
    pop(context);
  }

  void addMenuToCart(context) {
    cart.addItem(menu);
    update();
    pop(context);
  }

  void pop(context) {
    switch (previousPage) {
      case PageEnum.HomePage:
        Navigator.pop(context);
        break;
      case PageEnum.SearchPage:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
        );
        break;
      case PageEnum.CheckoutPage:
        Navigator.pop(context);
        break;
      case PageEnum.DetailPage:
        break;
    }
    print("STACK POP: " + Navigator.of(context).toString());
  }

  Future<bool> exit(context) {
    if (isUpdate) {
      menu.quantity = initQuantity;
      menu.notes.text = initNotes;
      cart.updateItem(menu, menu);
      print("NOTE: " + menu.notes.text);
      print('initnote: ' + initNotes);
    } else if (!isUpdate) {
      menu.quantity = 1;
      menu.notes = TextEditingController();
    }
    if (_menu.quantity == 0) _menu.quantity = 1;

    update();

    pop(context);
    return Future.value(true);
  }

  //////////////////////////////////////////////////////////////////////////////

  String get initNotes => _initNotes;

  set initNotes(String value) {
    _initNotes = value;
    update();
  }

  int get initQuantity => _initQuantity;

  set initQuantity(int value) {
    _initQuantity = value;
    update();
  }

  bool get isUpdate => _isUpdate;

  set isUpdate(bool value) {
    _isUpdate = value;
    update();
  }

  PageEnum get previousPage => _previousPage;

  set previousPage(PageEnum value) {
    _previousPage = value;
    update();
  }

  Menu get menu => _menu;

  set menu(Menu value) {
    _menu = value;
    update();
  }
}
