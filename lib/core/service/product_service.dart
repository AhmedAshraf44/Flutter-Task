import 'package:kartngo_task/feature/home/data/models/product_model.dart';
import 'package:kartngo_task/feature/home/data/repo/product_repo.dart';

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
