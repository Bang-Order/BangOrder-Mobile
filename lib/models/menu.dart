part of 'models.dart';

class Menu {
  int id;
  String name;
  String description;
  int price;
  String image;
  TextEditingController notes = TextEditingController();
  int quantity = 1;
  bool isUpdate = false;

  Menu({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
    );
  }
}
