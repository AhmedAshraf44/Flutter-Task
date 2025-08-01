import '../../../data/models/product_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class CreateDatabaseState extends HomeState {}

class GetDatabaseState extends HomeState {
  final List<ProductModel> products;

  GetDatabaseState({required this.products});
}

class GetDatabaseLoadingState extends HomeState {}
