import 'package:flutter/material.dart';

import '../../../../../core/style/app_style.dart';


class CartPriceRow extends StatelessWidget {
  const CartPriceRow({
    super.key,
    required this.tittle,
    required this.price,
    this.priceColor,
  });
  final String tittle;
  final String price;
  final Color? priceColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tittle,
          style: AppStyles.textStyle16Regular.copyWith(
            color: Colors.black.withValues(alpha: .5),
          ),
        ),
        Text(
          price,
          style: AppStyles.textStyle16Bold.copyWith(
            color: priceColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
