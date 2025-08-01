import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_color.dart';
import '../../../../product_details/presentation/view/product_details_view.dart';
import '../../../data/models/product_model.dart';
import '../../manger/home_cubit/home_cubit.dart';
import 'product_image.dart';
import 'product_name.dart';
import 'quantity_selector.dart';

class BuildProductItem extends StatelessWidget {
  const BuildProductItem(
      {super.key, required this.product, required this.index});
  final ProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    // late final cubit = HomeCubit.get(context);
    void incrementQuantity() => context.read<HomeCubit>().incrementQuantity(product);
    void decrementQuantity() => context.read<HomeCubit>().decrementQuantity(product);


    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsView(
              product: product,
            ),
          ),
        );
      },
      child: Card(
        color: AppColors.kBackgroundCard,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImage(imagePath: product.image),
              const SizedBox(height: 8),
              ProductName(
                name: product.title,
              ),
              const Spacer(),
              QuantitySelector(
                quantityNotifier: product.quantity,
                price: product.price,
                onIncrement: incrementQuantity,
                onDecrement: decrementQuantity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
