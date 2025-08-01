import 'package:flutter/material.dart';
import 'package:kartngo_task/core/functions/show_snack_bar.dart';
import '../../../../../core/constants/app_color.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../home/data/models/product_model.dart';
import 'cart_view_body.dart';

class FilledCartView extends StatelessWidget {
  const FilledCartView({
    super.key,
    required this.product,
    required this.total,
  });
  final List<ProductModel> product;
  final double total;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartViewBody(product: product, subTotal: total),
            const SizedBox(height: 20),
            CustomButton(
              text: 'تأكيد الطلب',
              color: AppColors.kButtonPrimary,
              onTap: () {
                showSnackBar(
                  context,
                  message: 'تم تأكيد طلبك بنجاح',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
