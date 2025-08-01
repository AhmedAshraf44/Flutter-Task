import 'package:flutter/material.dart';
import 'package:kartngo_task/feature/home/data/models/product_model.dart';
import 'custom_cart_design_item.dart';
import 'custom_row_cart_item_info.dart';
import 'cart_price_row.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    super.key,
    required this.product,
    required this.index,
  });
  final ProductModel product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return CustomCartDesignItem(
      widget: Column(
        children: [
          CartItemInfoRow(
            product: product,
          ),
          SizedBox(
            height: 12,
          ),
          CartPriceRow(
            tittle: 'Price:',
            price: 'SAR ${product.price}',
          ),
          CartPriceRow(
            tittle: 'Quantity:',
            price: '×${product.quantity.value}',
          ),
          CartPriceRow(
            tittle: 'Subtotal:',
            price:
                'SAR ${(product.price * product.quantity.value).toStringAsFixed(2)}',
          ),
        ],
      ),
    );
  }
}
