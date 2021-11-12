part of 'models.dart';

// To parse this JSON data, do
// final barcode = barcodeFromJson(jsonString);

BarcodeModel barcodeModelFromJson(String str) =>
    BarcodeModel.fromJson(json.decode(str));

String barcodeModelToJson(BarcodeModel data) => json.encode(data.toJson());

class BarcodeModel {
  BarcodeModel({
    required this.restaurantId,
    required this.restaurantTableId,
  });

  String restaurantId;
  String restaurantTableId;

  factory BarcodeModel.fromJson(Map<String, dynamic> json) => BarcodeModel(
        restaurantId: json["restaurant_id"],
        restaurantTableId: json["table_id"],
      );

  Map<String, dynamic> toJson() => {
        "restaurant_id": restaurantId,
        "table_id": restaurantTableId,
      };
}
