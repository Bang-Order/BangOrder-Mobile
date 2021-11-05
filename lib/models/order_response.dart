part of 'models.dart';

class OrderResponse {
  int id;
  int tableId;
  String transactionId;
  String invoiceUrl;
  String orderStatus;
  List<Menu> orderItems;
  String totalPrice;
  DateTime createdAt;

  OrderResponse({
    required this.id,
    required this.tableId,
    required this.transactionId,
    required this.invoiceUrl,
    required this.orderStatus,
    required this.orderItems,
    required this.totalPrice,
    required this.createdAt,
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
        createdAt: DateTime.parse(json["created_at"]),
      );
}
