import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/style/app_style.dart';
import '../../../../cart/presentation/view/cart_view.dart';
import '../../../data/models/product_model.dart';
import '../../manger/home_cubit/home_cubit.dart';
import 'build_label.dart';
import 'build_total_display.dart';

class BuildCartSummary extends StatelessWidget {
  const BuildCartSummary({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 20,
      right: 20,
      child: InkWell(
        onTap: () async {
          final cartItems = _getSelectedProducts();
          for (var item in cartItems) {
            // HomeCubit.get(context)
            //     .updateQuantitySilently(item.id!, item.quantity.value);
            // context.read<HomeCubit>().updateQuantity(product);
            context.read<HomeCubit>().updateQuantity(item);

          }
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CartView(
              product: cartItems,
              total: _calculateTotal(cartItems),
            );
          }));
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.kButtonPrimary,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildLabel(),
                ValueListenableBuilder<double>(
                  valueListenable: _buildTotalNotifier(),
                  builder: (_, total, __) => BuildTotalDisplay(
                    total: total,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Returns only products with quantity > 0
  List<ProductModel> _getSelectedProducts() =>
      products.where((p) => p.quantity.value > 0).toList();

  /// Builds combined total notifier from all product quantities
  ValueNotifier<double> _buildTotalNotifier() {
    final notifier = ValueNotifier<double>(_calculateTotal(products));

    for (var product in products) {
      product.quantity.addListener(() {
        notifier.value = _calculateTotal(products);
      });
    }

    return notifier;
  }

  double _calculateTotal(List<ProductModel> products) {
    return products.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity.value),
    );
  }
}
