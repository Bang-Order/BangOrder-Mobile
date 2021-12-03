part of '_models.dart';

class MenuCategory {
  int id;
  String name;

  MenuCategory({
    required this.id,
    required this.name,
  });

  factory MenuCategory.fromJson(Map<String, dynamic> json) {
    return MenuCategory(
      id: json['id'],
      name: json['name'],
    );
  }
}

List<MenuCategory> parseMenuCategories(String responseBody) {
  return List<MenuCategory>.from(json.decode(responseBody)['data'].map((x) {
    return MenuCategory.fromJson(x);
  }));
}
