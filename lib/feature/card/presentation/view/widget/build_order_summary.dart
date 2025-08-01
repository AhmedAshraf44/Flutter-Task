import 'package:flutter/material.dart';

import '../../../../../core/style/app_style.dart';
import 'custom_cart_design_item.dart';
import 'cart_price_row.dart';
import '../../../../../core/utils/widgets/my_divider.dart';

class BuildOrderSummary extends StatelessWidget {
  const BuildOrderSummary({
    super.key, required this.total,
  });
  final double total;
  @override
  Widget build(BuildContext context) {
    return CustomCartDesignItem(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: AppStyles.textStyle18Bold.copyWith(
              color: Colors.black,
            ),
          ),
          MyDivider(top: 5),
          CartPriceRow(
            tittle: 'Subtotal:',
            price: 'SAR ${total.toStringAsFixed(2)}',
          ),
          CartPriceRow(
            tittle: 'VAT:',
            price: 'SAR 20',
          ),
          CartPriceRow(
            tittle: 'total:',
            price: 'SAR ${(total + 20).toStringAsFixed(2)}',
            priceColor: Color(0xffEC362B),
          ),
        ],
      ),
    );
  }
}
