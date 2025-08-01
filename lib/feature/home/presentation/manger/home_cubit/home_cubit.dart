import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../../data/models/product_model.dart';
import 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitialState());
//
//   static HomeCubit get(context) => BlocProvider.of(context);
//
//   final List<String> categories = [
//     'أفضل العروض',
//     'مستورد',
//     'أجبان قابلة للدهن',
//     'أجبان',
//   ];
//   late Database database;
//   List<ProductModel> products = [];
//
//
//
//   void incrementQuantity(int productId) {
//     final index = products.indexWhere((p) => p.id == productId);
//     if (index != -1) {
//       products[index].quantity.value++; //
//     }
//     updateQuantitySilently(productId, products[index].quantity.value,);
//   }
//
//   void decrementQuantity(int productId) {
//     final index = products.indexWhere((p) => p.id == productId);
//     if (index != -1 && products[index].quantity.value > 0) {
//       products[index].quantity.value--;
//     }
//     updateQuantitySilently(productId, products[index].quantity.value,);
//   }
//   void createDatabase() {
//     openDatabase(
//       'todo.db',
//       version: 1,
//       onCreate: (database, version) {
//         log("Database created");
//         database
//             .execute(
//           'CREATE TABLE products (id INTEGER PRIMARY KEY, title TEXT, image TEXT, price REAL, quantity INTEGER , isFavorite INTEGER, description TEXT)',
//         )
//             .then((value) {
//           log("Table created");
//         }).catchError((error) {
//           log("Error creating table: $error");
//         });
//       },
//       onOpen: (database) {
//         getFromDatabase(database);
//         log("Database opened");
//       },
//     ).then((value) {
//       database = value;
//       emit(CreateDatabaseState());
//       insertInitialProducts();
//     });
//   }
//
//   void getFromDatabase(Database database) {
//     products.clear();
//     emit(GetDatabaseLoadingState());
//
//     database.rawQuery('SELECT * FROM products').then((value) {
//       products = value.map((e) => ProductModel.fromJson(e)).toList();
//       emit(GetDatabaseState(
//         products: products,
//       ));
//     });
//   }
//
//   Future<void> insertInitialProducts() async {
//     final count = Sqflite.firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM products'));
//     if (count == 0) {
//       final initialProducts =ProductModel.products;
//       for (var product in initialProducts) {
//         await insertProduct(product);
//       }
//     }
//     getFromDatabase(database);
//   }
//
//   Future<void> insertProduct(ProductModel product) async {
//     await database
//         .insert(
//       'products',
//       product.toJson(),
//       conflictAlgorithm: ConflictAlgorithm.ignore,
//     )
//         .then((value) {
//       log('Inserted product ID: $value');
//     }).catchError((error) {
//       log('Error inserting product: $error');
//     });
//   }
//
//   void updateQuantitySilently(int productId, int newQuantity) {
//     database.rawUpdate(
//       'UPDATE products SET quantity = ? WHERE id = ?',
//       [newQuantity, productId],
//     ).catchError((error) {
//       log('Error updating quantity: $error');
//     });
//   }
//
//   void updateIsFavoriteSilently(int productId, bool isFavorite) {
//     database.rawUpdate(
//       'UPDATE products SET isFavorite = ? WHERE id = ?',
//       [isFavorite ? 1 : 0, productId],
//     ).catchError((error) {
//       log('Error updating isFavorite: $error');
//     });
//   }
//
// }
//
//

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
    final count = Sqflite.firstIntValue(await _database.rawQuery('SELECT COUNT(*) FROM products'));
    if (count == 0) {
      for (var product in products) {
        await _database.insert('products', product.toJson(), conflictAlgorithm: ConflictAlgorithm.ignore);
      }
    }
  }

  Future<void> updateQuantity(int productId, int quantity) async {
    await _database.rawUpdate('UPDATE products SET quantity = ? WHERE id = ?', [quantity, productId]);
  }

  Future<void> updateFavorite(int productId, bool isFav) async {
    await _database.rawUpdate('UPDATE products SET isFavorite = ? WHERE id = ?', [isFav ? 1 : 0, productId]);
  }
}



class ProductService {
  final ProductRepository repository;

  ProductService(this.repository);

  Future<List<ProductModel>> loadProducts() => repository.getProducts();

  Future<void> increaseQuantity(ProductModel product) async {
    product.quantity.value++;
    await repository.updateQuantity(product.id!, product.quantity.value);
  }

  Future<void> decreaseQuantity(ProductModel product) async {
    if (product.quantity.value > 0) {
      product.quantity.value--;
      await repository.updateQuantity(product.id!, product.quantity.value);
    }
  }

  Future<void> toggleFavorite(ProductModel product) async {
    final newValue = !product.isFavorite.value;
    product.isFavorite.value = newValue;
    await repository.updateFavorite(product.id!, newValue);

  }
}



class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._service, this._repository) : super(HomeInitialState());

  final ProductService _service;
  final ProductRepository _repository;

  List<ProductModel> products = [];
  final List<String> categories = ['أفضل العروض', 'مستورد', 'أجبان قابلة للدهن', 'أجبان'];

  Future<void> init() async {
    emit(GetDatabaseLoadingState());
    await _repository.createDatabase();
    await _repository.insertInitialProducts(ProductModel.products);
    products = await _service.loadProducts();
    emit(GetDatabaseState(products: products));
  }

  void incrementQuantity(ProductModel product) async {
    await _service.increaseQuantity(product);
  }

  void decrementQuantity(ProductModel product) async {
    await _service.decreaseQuantity(product);
  }

  void toggleFavorite(ProductModel product) async {
    await _service.toggleFavorite(product);
  }
  void updateQuantity(ProductModel product) async {
    await _repository.updateQuantity(product.id!, product.quantity.value);
  }
}
