import 'package:flutter/material.dart';
import 'package:kartngo_task/feature/home/data/models/product_model.dart';
import '../../../../core/functions/build_app_bar.dart';
import 'widget/empty_cart_view.dart';
import 'widget/filled_cart_view.dart';

class CartView extends StatelessWidget {
  const CartView({
    super.key,
    required this.product,
    required this.total,
  });
  final List<ProductModel> product;
  final double total;
  bool get isCartEmpty => product.isEmpty || total == 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "السلة"),
      body: isCartEmpty
          ? const EmptyCartView()
          : FilledCartView(product: product, total: total),
    );
  }
}
