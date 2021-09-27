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
      name: json['category-name'],
      menus: json['menu'],
    );
  }
}
