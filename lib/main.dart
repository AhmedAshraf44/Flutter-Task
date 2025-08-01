import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartngo_task/core/utils/bloc_observer.dart';
import 'package:kartngo_task/core/utils/service_locator.dart';
import 'package:kartngo_task/feature/home/presentation/view/home_view.dart';

import 'core/functions/build_light_theme.dart';
import 'core/service/product_service.dart';
import 'feature/home/data/repo/product_repo.dart';
import 'feature/home/presentation/manger/home_cubit/home_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  runApp(
    const KartNGoApp(),
  );
}

class KartNGoApp extends StatelessWidget {
  const KartNGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        getIt<ProductService>(),
        getIt<ProductRepository>(),
      )..init(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Hide the debug banner
        title: 'KartNGo Task',
        theme: buildLightTheme(context),
        home: const HomeView(),
      ),
    );
  }
}
