import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        username TEXT,
        email TEXT,
        password TEXT
      )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'account.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      }
    );
  }

  static Future<int> createItem(String username, String email, String password) async {
    final db = await SQLHelper.db();

    final data = {'username': username, 'email': email, 'password': password};
    final id = await db.insert('items', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: 'id');
  }

  static Future<int> updateItem(int id, String username, String email, String password) async {
    final db = await SQLHelper.db();

    final data = {
      'username': username,
      'email': email,
      'password': password
    };

    final result = await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteDog(int id) async {
    final db = await SQLHelper.db();

    await db.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}