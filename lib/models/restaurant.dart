part of '_models.dart';

class Restaurant {
  int id;
  String name;
  String image;
  int tableId;
  String tableNumber;
  String address;

  Restaurant({
    this.id = -1,
    this.name = '',
    this.image = '',
    this.tableId = -1,
    this.tableNumber = '',
    this.address = '',
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

Restaurant parseRestaurant(data) => Restaurant.fromJson(jsonDecode(data));