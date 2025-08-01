import 'package:flutter/material.dart';
import 'package:kartngo_task/feature/home/data/models/product_model.dart';

import '../../../../../core/utils/widgets/my_divider.dart';
import 'custom_customer_review.dart';
import 'custom_description.dart';
import 'product_details_header.dart';
class CustomProductDetailsBody extends StatelessWidget {
  const CustomProductDetailsBody({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 17),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailsHeader(
              product: product,
            ),
            MyDivider(),
            CustomDescription(
              product: product,
            ),
            MyDivider(),
            CustomCustomerReview(
              product: product,
            ),
          ],
        ),
      ),
    );
  }
}
