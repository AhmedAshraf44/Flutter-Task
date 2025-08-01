import 'package:flutter/material.dart';
import 'package:kartngo_task/feature/home/data/models/product_model.dart';
import 'package:kartngo_task/feature/product_details/presentation/view/widget/custom_product_details_body.dart';

import '../../../../core/functions/build_app_bar.dart';
import 'widget/build_bottom_sheet.dart';
class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'تفاصيل المنتج'),
      bottomSheet: BuildBottomSheet(
        product: product,
      ),
      body: CustomProductDetailsBody(
        product: product,
      ),
    );
  }
}
