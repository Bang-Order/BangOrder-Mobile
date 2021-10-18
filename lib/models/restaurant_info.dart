part of 'models.dart';

class RestaurantInfo {
  int id;
  String name;
  String image;
  String email;
  String phoneNumber;
  String address;

  RestaurantInfo({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.phoneNumber,
    required this.address});

  factory RestaurantInfo.fromJson(Map<String, dynamic> json) {
    return RestaurantInfo(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json ['telephone_number'],
      address: json['address'],
      image: json['image']
    );
  }
}
