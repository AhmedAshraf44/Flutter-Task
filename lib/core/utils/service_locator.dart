import 'package:get_it/get_it.dart';
import 'package:kartngo_task/core/service/product_service.dart';
import 'package:kartngo_task/feature/home/data/repo/product_repo.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => ProductRepository());
  getIt.registerLazySingleton(() => ProductService(getIt<ProductRepository>()));
}
