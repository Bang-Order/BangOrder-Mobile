part of 'models.dart';

class Restaurant {
  int id;
  String name;
  String image;
  String email;
  String phoneNumber;
  String address;

  Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['telephone_number'],
      address: json['address'],
      image: json['image'],
    );
  }
}
