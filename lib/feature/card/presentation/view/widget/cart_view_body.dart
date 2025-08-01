
import 'package:flutter/material.dart';
import 'package:kartngo_task/feature/home/data/models/product_model.dart';

import 'build_order_summary.dart';
import 'cart_item_info_row.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
    required this.product, required this.subTotal,
  });
  final List<ProductModel> product;
  final double subTotal;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: product.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 22),
              child: CustomCartItem(
                product: product[index],
                index: index,
                //subTotal: subTotal,
              ),
            );
            // });
          },
        ),
        SizedBox(
          height: 17,
        ),
        BuildOrderSummary(total:subTotal ,),
      ],
    );
  }
}
