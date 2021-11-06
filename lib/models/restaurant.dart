part of 'models.dart';

class Restaurant {
  int id;
  String name;
  String image;
  int tableId;
  String tableNumber;
  String address;

  Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.tableId,
    required this.tableNumber,
    required this.address,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['restaurant_id'],
      name: json['name'],
      address: json['address'],
      image: json['image'],
      tableId: json['table_id'],
      tableNumber: json['table_number'],

    );
  }
}
