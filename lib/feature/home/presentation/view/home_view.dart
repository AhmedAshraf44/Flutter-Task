import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartngo_task/feature/home/presentation/view/widget/home_content.dart';
import '../../../../core/functions/build_app_bar.dart';
import '../manger/home_cubit/home_cubit.dart';
import '../manger/home_cubit/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'التصنيفات'),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetDatabaseLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetDatabaseState) {
            return HomeContent(products: state.products);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
