part of '_database.dart';

class DatabaseOrderHistory {
  static Future<void> createTables(Database database) async {
    await database.execute(
      'CREATE TABLE history(id INTEGER PRIMARY KEY)',
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

  static Future<void> insertOrder(OrderHistory order) async {
    final db = await DatabaseOrderHistory.db();
    await db.insert(
      'history',
      {'id': order.id},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<int>> getAllOrder() async {
    print("getAllOrder");
    final db = await DatabaseOrderHistory.db();

    final List<Map<String, dynamic>> maps = await db.query('history');
    return List.generate(maps.length, (i) => maps[i]['id']);
  }

  static Future<void> deleteOrder(int id) async {
    final db = await DatabaseOrderHistory.db();

    await db.delete(
      'history',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
