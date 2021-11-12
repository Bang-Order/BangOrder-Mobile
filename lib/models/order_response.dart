part of 'models.dart';

class OrderResponse {
  String? restaurantName;
  String? image;
  int id;
  int tableId;
  String transactionId;
  String invoiceUrl;
  String orderStatus;
  List<Menu>? orderItems;
  String totalPrice;
  String? createdAt;

  OrderResponse({
    this.restaurantName,
    this.image,
    required this.id,
    required this.tableId,
    required this.transactionId,
    required this.invoiceUrl,
    required this.orderStatus,
    this.orderItems,
    required this.totalPrice,
    this.createdAt,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        id: json["id"],
        tableId: json["table_id"],
        transactionId: json["transaction_id"],
        invoiceUrl: json["invoice_url"],
        orderStatus: json["order_status"],
        orderItems: List<Menu>.from(
          json["order_items"].map((x) => Menu.orderResponse(x)),
        ),
        totalPrice: json["total_price"],
        createdAt: DateTime.parse(json["created_at"]).toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "table_id": tableId,
        "transaction_id": transactionId,
        "invoice_url": invoiceUrl,
        "order_status": orderStatus,
        "order_items": List<Menu>.from(orderItems!.map((x) => x.toJson(x))),
        "total_price": totalPrice,
        "created_at": createdAt!,
      };

  Map<String, dynamic> fromHistory(Restaurant restaurant) => {
        "id": id,
        "restaurant_name": restaurant.name,
        "image": restaurant.image,
        "table_id": tableId,
        "transaction_id": transactionId,
        "invoice_url": invoiceUrl,
        "order_status": orderStatus,
        "total_price": totalPrice,
        "created_at": createdAt!,
      };
}
