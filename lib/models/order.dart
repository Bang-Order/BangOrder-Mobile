part of 'models.dart';

class Order {
  int restaurantTableId;
  int totalPrice;
  List<Menu> orderItems;

  Order({
    required this.restaurantTableId,
    required this.totalPrice,
    required this.orderItems,
  });
}
