import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartngo_task/core/constants/app_color.dart';
import 'package:kartngo_task/core/style/app_style.dart';
import 'package:kartngo_task/core/utils/bloc_observer.dart';
import 'package:kartngo_task/feature/home/presentation/view/home_view.dart';

import 'core/functions/build_light_theme.dart';
import 'feature/home/presentation/manger/home_cubit/home_cubit.dart';

void main() {

  Bloc.observer = MyBlocObserver();
  runApp(const KartNGoApp());
}

class KartNGoApp extends StatelessWidget {
  const KartNGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = ProductRepository();
    final service = ProductService(repository);
    return  BlocProvider(
        create: (context) => HomeCubit(service, repository)..init(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      title: 'KartNGo Task',
      theme: buildLightTheme(context),
      home: const HomeView(),
    ),
    );
  }
}


