import 'package:flutter/material.dart';
import 'package:kartngo_task/feature/home/data/models/product_model.dart';

import '../../../../../core/style/app_style.dart';
class CustomDescription extends StatelessWidget {
  const CustomDescription({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: AppStyles.textStyle18Bold.copyWith(
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          product.description,
          style: AppStyles.textStyle14Regular.copyWith(
            color: Color(0xff8B8B8B),
          ),
        ),
      ],
    );
  }
}
