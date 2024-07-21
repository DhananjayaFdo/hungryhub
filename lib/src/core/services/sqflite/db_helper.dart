import 'package:hungyhub/src/core/widgets/cus_widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "myDatabase.db";
  static const _databaseVersion = 1;

  static const table = 'cart';
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnImage = 'image';
  static const columnUnitType = 'unit_type';
  static const columnPrice = 'price';
  static const columnQuantity = 'quantity';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $table (
            $columnId TEXT PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnImage TEXT NOT NULL,
            $columnUnitType TEXT NOT NULL,
            $columnPrice INTEGER NOT NULL,
            $columnQuantity INTEGER NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> insertData({required String tableName, required dynamic data}) async {
    final db = await database;
    await db.insert(tableName, data);
  }

  Future<List<Map<String, dynamic>>> readData({required String table}) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query(table);

    if (results.isNotEmpty) {
      return results;
    } else {
      return [];
    }
  }

  Future<void> increaseQuantity(String id) async {
    final db = await database;
    await db.rawUpdate(
      'UPDATE $table SET $columnQuantity = $columnQuantity + 1 WHERE $columnId = ?',
      [id],
    );
  }

  Future<void> decreaseQuantity(String id) async {
    final db = await database;

    List<Map<String, dynamic>> result = await db.query(
      table,
      columns: [columnQuantity],
      where: '$columnId = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      int currentQuantity = result.first[columnQuantity] as int;
      if (currentQuantity > 1) {
        await db.rawUpdate(
          'UPDATE $table SET $columnQuantity = $columnQuantity - 1 WHERE $columnId = ?',
          [id],
        );
      } else {
        await db.delete(
          table,
          where: '$columnId = ?',
          whereArgs: [id],
        );
      }
    }
  }

  Future<void> removeCartItem(String id) async {
    final db = await database;
    await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<void> clearCart() async {
    final db = await database;
    await db.delete(table);
  }

  Future<void> addItemToCart({required Map<String, dynamic> itemData}) async {
    final db = await database;

    // Check if item already exists
    final List<Map<String, dynamic>> existingItems = await db.query(
      table,
      where: '${DatabaseHelper.columnName} = ?',
      whereArgs: [itemData[DatabaseHelper.columnName]],
    );

    if (existingItems.isNotEmpty) {
      // Item already exists in the cart
      flutterToast("${itemData[DatabaseHelper.columnName]} is already in the cart.");
    } else {
      // Item does not exist, add it to the cart
      await db.insert(table, itemData);
      flutterToast("${itemData[DatabaseHelper.columnName]} added to the cart.");
    }
  }
}
