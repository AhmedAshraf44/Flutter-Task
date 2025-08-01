import 'package:flutter/material.dart';
import 'package:kartngo_task/core/constants/app_color.dart';
import 'package:kartngo_task/feature/home/data/models/product_model.dart';
import '../../../../../core/style/app_style.dart';

class CartItemInfoRow extends StatelessWidget {
  const CartItemInfoRow({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.kAccentOrange, width: 2),
          ),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Image.asset(
                product.image,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text(product.title, style: AppStyles.textStyle18Bold),
        ),
      ],
    );
  }
}
