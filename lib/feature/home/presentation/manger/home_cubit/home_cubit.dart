import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartngo_task/core/service/product_service.dart';
import 'package:kartngo_task/feature/home/data/repo/product_repo.dart';
import '../../../data/models/product_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._service, this._repository) : super(HomeInitialState());

  final ProductService _service;
  final ProductRepository _repository;

  List<ProductModel> products = [];
  final List<String> categories = [
    'أفضل العروض',
    'مستورد',
    'أجبان قابلة للدهن',
    'أجبان'
  ];

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
