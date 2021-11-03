part of 'models.dart';

class Menu {
  int id;
  int categoryId;
  String name;
  String description;
  double price;
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
    this.price = 0,
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
      price: double.parse(json['price'].toString()),
      image: json['image'],
      isAvailable: json['is_available'],
      isRecommended: json['is_recommended'],
    );
  }

  factory Menu.orderResponse(Map<String, dynamic> json) {
    return Menu(
      name: json['name'],
      quantity: json['quantity'],
      price: double.parse(json['price']),
    );
  }

  Map<String, dynamic> toJson(Menu menu) {
    return {
      'menu_id': menu.id,
      'quantity': menu.quantity,
    };
  }
}
