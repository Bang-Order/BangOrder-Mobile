part of 'models.dart';

class Cart {
  int menuId;
  int quantity = 0;
  TextEditingController notes;

  Cart({
    required this.menuId,
    required this.quantity,
    required this.notes,
  });
}
