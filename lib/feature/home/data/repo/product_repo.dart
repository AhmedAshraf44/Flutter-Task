import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import '../models/product_model.dart';

class ProductRepository {
  late Database _database;

  Future<void> createDatabase() async {
    _database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE products (
            id INTEGER PRIMARY KEY,
            title TEXT,
            image TEXT,
            price REAL,
            quantity INTEGER,
            isFavorite INTEGER,
            description TEXT
          )
        ''');
        log("Database and Table created");
      },
    );
  }

  Future<List<ProductModel>> getProducts() async {
    final result = await _database.rawQuery('SELECT * FROM products');
    return result.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<void> insertInitialProducts(List<ProductModel> products) async {
    final count = Sqflite.firstIntValue(
        await _database.rawQuery('SELECT COUNT(*) FROM products'));
    if (count == 0) {
      for (var product in products) {
        await _database.insert('products', product.toJson(),
            conflictAlgorithm: ConflictAlgorithm.ignore);
      }
    }
  }

  Future<void> updateQuantity(int productId, int quantity) async {
    await _database.rawUpdate(
        'UPDATE products SET quantity = ? WHERE id = ?', [quantity, productId]);
  }

  Future<void> updateFavorite(int productId, bool isFav) async {
    await _database.rawUpdate('UPDATE products SET isFavorite = ? WHERE id = ?',
        [isFav ? 1 : 0, productId]);
  }
}
