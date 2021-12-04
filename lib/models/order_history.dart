part of '_models.dart';

class OrderHistory {
  int id;
  int restaurantId;
  int tableId;
  String tableNumber;
  String transactionId;
  String? invoiceUrl;
  String orderStatus;
  List<OrderItem> orderItems;
  String totalPrice;
  String createdAt;

  OrderHistory({
    required this.id,
    required this.restaurantId,
    required this.tableId,
    required this.tableNumber,
    required this.transactionId,
    required this.invoiceUrl,
    required this.orderStatus,
    required this.orderItems,
    required this.totalPrice,
    required this.createdAt,
  });

  factory OrderHistory.fromJson(Map<String, dynamic> json) {
    return OrderHistory(
      id: json["id"],
      restaurantId: json["restaurant_id"],
      tableId: json["table_id"],
      tableNumber: json["table_number"],
      transactionId: json["transaction_id"],
      invoiceUrl: json["invoice_url"],
      orderStatus: json["order_status"],
      orderItems: List<OrderItem>.from(
          json["order_items"].map((x) => OrderItem.fromJson(x))),
      totalPrice: json["total_price"],
      createdAt: json["created_at"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "restaurant_id": restaurantId,
      "table_id": tableId,
      "table_number": tableNumber,
      "transaction_id": transactionId,
      "invoice_url": invoiceUrl,
      "order_status": orderStatus,
      "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
      "total_price": totalPrice,
      "created_at": createdAt,
    };
  }
}

class OrderItem {
  String name;
  int quantity;
  String price;
  dynamic notes;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
    this.notes,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      name: json["name"],
      quantity: json["quantity"],
      price: json["price"],
      notes: json["notes"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "quantity": quantity,
      "price": price,
      "notes": notes,
    };
  }
}

List<OrderHistory> orderHistoryFromJson(String str) {
  return List<OrderHistory>.from(jsonDecode(str)['data'].map((x) {
    return OrderHistory.fromJson(x);
  }));
}

OrderHistory orderHistoryFromJson2(data) {
  return OrderHistory.fromJson(jsonDecode(data)['data']);
}

String orderHistoryToJson(List<OrderHistory> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
