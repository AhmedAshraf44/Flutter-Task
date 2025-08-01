import 'package:flutter/material.dart';
import 'package:kartngo_task/feature/home/data/models/product_model.dart';

import '../../../../../core/style/app_style.dart';
import 'customer_review_list_view.dart';

class CustomCustomerReview extends StatelessWidget {
  const CustomCustomerReview({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Customer Reviews',
          style: AppStyles.textStyle18Bold.copyWith(
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 29,
        ),
        CustomerReviewListView(),
        SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
