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

    Get.to(
      DetailMenuPage(key: Key('DetailMenuPage')),
      transition: Transition.cupertino,
      duration: Duration(milliseconds: 500),
    );
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

  void removeMenuInCart() {
    cart.deleteItem(menu.id);
    update();
    pop();
  }

  void updateMenuInCart() {
    cart.updateItem(menu, menu);
    update();
    pop();
  }

  void addMenuToCart() {
    cart.addItem(menu);
    update();
    pop();
  }

  void pop() {
    switch (previousPage) {
      case PageEnum.HomePage:
        Get.back();
        break;
      case PageEnum.SearchPage:
        Get.off(HomePage());
        break;
      case PageEnum.CheckoutPage:
        Get.back();
        break;
      case PageEnum.DetailPage:
        break;
    }
  }

  Future<bool> exit() {
    if (isUpdate) {
      menu.quantity = initQuantity;
      menu.notes.text = initNotes;
      cart.updateItem(menu, menu);
    } else if (!isUpdate) {
      menu.quantity = 1;
      menu.notes = TextEditingController();
    }
    if (_menu.quantity == 0) _menu.quantity = 1;

    update();

    pop();
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
