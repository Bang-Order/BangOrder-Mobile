part of 'models.dart';

class MenuCategory {
  int id;
  int restaurantId;
  String name;

  MenuCategory({
    required this.id,
    required this.restaurantId,
    required this.name,
  });

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    return MenuCategory(
      id: json['id'],
      restaurantId: json['restaurant_id'],
      name: json['name'],
    );
  }
}
