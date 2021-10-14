part of 'models.dart';

class Order {
  int restaurantTableId;
  int totalPrice;
  List<Map<String, OrderItem>> orderItems;

  Order({
    required this.restaurantTableId,
    required this.totalPrice,
    required this.orderItems,
  });
}
