part of 'models.dart';

class MenuCategory {
  int id;
  String name;
  List<Menu> menus;

  MenuCategory({
    required this.id,
    required this.name,
    required this.menus,
  });

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    return MenuCategory(
      id: json['id'],
      name: json['name'],
=======
      name: json['category-name'],
      menus: json['menu'],
>>>>>>> 91cd68e2cf252b4ca33f027acd8d82b71fddf117
    );
  }
}
