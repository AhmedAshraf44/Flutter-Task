import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product_model.dart';
import '../../manger/home_cubit/home_cubit.dart';
import 'build_cart_summary.dart';
import 'build_category_chips.dart';
import 'build_product_grid.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: BuildCategoryChips(categories: cubit.categories),
            ),
            Expanded(
              child: BuildProductGrid(products: products),
            ),
          ],
        ),
        BuildCartSummary(products: products),
      ],
    );
  }
}