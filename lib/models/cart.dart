part of 'models.dart';

class Cart {
  int menuId;
  String menuName;
  int quantity = 0;
  int price = 0;
  TextEditingController notes;

  Cart({
    required this.menuId,
    required this.menuName,
    required this.quantity,
    required this.price,
    required this.notes,
  });
}
