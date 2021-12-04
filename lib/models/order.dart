part of '_models.dart';

class Order {
  int restaurantTableId;
  double totalPrice;
  List<Menu> orderItems;

  Order({
    required this.restaurantTableId,
    required this.totalPrice,
    required this.orderItems,
  });

  Map<String, dynamic> toJson(Order order) => {
        "restaurant_table_id": restaurantTableId,
        "total_price": totalPrice,
        "order_items": order.orderItems.map((Menu menu) {
          return menu.toJson(menu);
        }).toList(),
      };
}
