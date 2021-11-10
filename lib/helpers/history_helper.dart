part of 'helpers.dart';

class HistoryHelper {
  static Future<void> createTables(Database database) async {
    await database.execute(
      'CREATE TABLE history(id INTEGER PRIMARY KEY, restaurant_name TEXT, image TEXT, table_id INTEGER, transaction_id TEXT, invoice_url TEXT, order_status TEXT, total_price TEXT, created_at TEXT)',
    );
  }

  static Future<Database> db() async {
    return openDatabase(
      join(await getDatabasesPath(), 'order_history.db'),
      version: 1,
      onCreate: (db, version) async {
        await createTables(db);
      },
    );
  }

  static Future<void> insertOrder(
      OrderResponse order, Restaurant restaurantName) async {
    final db = await HistoryHelper.db();
    await db.insert(
      'history',
      order.fromHistory(restaurantName),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<OrderResponse>> getAllOrder() async {
    final db = await HistoryHelper.db();

    final List<Map<String, dynamic>> maps = await db.query('history');
    print("getAllOrder");
    return List.generate(maps.length, (i) {
      return OrderResponse(
        id: maps[i]['id'],
        image: maps[i]['image'],
        restaurantName: maps[i]['restaurant_name'],
        tableId: maps[i]['table_id'],
        transactionId: maps[i]['transaction_id'],
        invoiceUrl: maps[i]['invoice_url'],
        orderStatus: maps[i]['order_status'],
        totalPrice: maps[i]['total_price'],
        createdAt: maps[i]['created_at'],
      );
    });
  }

  static Future<void> updateOrder(OrderResponse order) async {
    final db = await HistoryHelper.db();

    await db.update(
      'history',
      order.toJson(),
      where: 'id = ?',
      whereArgs: [order.id],
    );
  }

  static Future<void> deleteOrder(int id) async {
    final db = await HistoryHelper.db();

    await db.delete(
      'history',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
