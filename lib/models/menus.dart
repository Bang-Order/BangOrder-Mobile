part of 'models.dart';

class Menus {
  int id;
  String kategoriMenu;
  String nama;
  int harga;
  String deskripsi;
  String gambar;

  Menus({
    required this.id,
    required this.kategoriMenu,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.gambar,
  });

  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
      id: json['id'],
      kategoriMenu: json['kategori_menu'],
      nama: json['nama'],
      harga: json['harga'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
    );
  }
}
