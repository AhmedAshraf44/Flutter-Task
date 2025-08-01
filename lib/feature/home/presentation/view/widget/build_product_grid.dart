import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';

import 'build_product_item.dart';

class BuildProductGrid extends StatelessWidget {
  const BuildProductGrid({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(
        bottom: 70.0,
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.68, // Adjust aspect ratio to fit content
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return BuildProductItem(
          product: products[index],
          index: index,
        ); // Step 5: Develop the product item widget
      },
    );
  }
}
