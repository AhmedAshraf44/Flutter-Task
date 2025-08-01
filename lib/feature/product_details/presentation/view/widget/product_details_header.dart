import 'package:flutter/material.dart';
import 'package:kartngo_task/feature/home/data/models/product_model.dart';

import '../../../../../core/style/app_style.dart';
import 'custom_rating.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height / 3,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                 image: AssetImage(product.image)),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        CustomRating(
          size: 20,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          product.title,
          style: AppStyles.textStyle18Bold.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text('SAR ${product.price}', style: AppStyles.textStyle16Bold),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      ],
    );
  }
}
