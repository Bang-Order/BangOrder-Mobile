part of '_models.dart';

class Menu {
  int id;
  int? categoryId;
  String name;
  String? description;
  String price;
  String image;
  int isAvailable;
  int isRecommended;
  TextEditingController notes = TextEditingController();
  int quantity = 1;
  bool isUpdate = false;

  Menu({
    this.id = 0,
    this.categoryId = 0,
    this.name = '',
    this.description = '',
    this.price = '',
    this.image = '',
    this.isAvailable = 0,
    this.isRecommended = 0,
    this.quantity = 1,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      categoryId: json['category_id'],
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toString(),
      image: json['image'],
      isAvailable: json['is_available'],
      isRecommended: json['is_recommended'],
    );
  }

  factory Menu.orderResponse(Map<String, dynamic> json) {
    return Menu(
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson(Menu menu) {
    return {
      'menu_id': menu.id,
      'quantity': menu.quantity,
    };
  }
}

List<Menu> parseMenus(String responseBody) {
  return List<Menu>.from(
    json.decode(responseBody)['data'].map((x) => Menu.fromJson(x)),
  );
}
