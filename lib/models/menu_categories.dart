part of 'models.dart';

class MenuCategories {
  String kategoriMenu;

  MenuCategories({required this.kategoriMenu});

  factory MenuCategories.fromJson(Map<String, dynamic> json) {
    return MenuCategories(
      kategoriMenu: json['kategori_menu'],
    );
  }
}
