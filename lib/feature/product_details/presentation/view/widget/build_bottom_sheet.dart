import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartngo_task/core/constants/app_color.dart';
import '../../../../../core/functions/show_toast.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../../home/presentation/manger/home_cubit/home_cubit.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: Colors.grey.shade300),
          )),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 11),
        child: ValueListenableBuilder<bool>(
          valueListenable: product.isFavorite,
          builder: (context, isFav, _) {
            return Row(
              children: [
                _buildFavoriteIcon(context, isFav),
                const SizedBox(width: 20),
                _buildFavoriteButton(context, isFav),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFavoriteIcon(BuildContext context, bool isFav) {
    return InkWell(
      onTap: () {
        context.read<HomeCubit>().toggleFavorite(product);
        final newValue = product.isFavorite.value;
        showToast(
          context,
          newValue
              ? 'تمت الإضافة إلى المفضلة بنجاح'
              : 'تم الحذف من المفضلة بنجاح',
          color: newValue ? AppColors.kButtonPrimary : Colors.red,
          icon: Icons.favorite,
        );
      },
      child: Icon(
        size: 30,
        isFav ? Icons.favorite : Icons.favorite_border,
        color: isFav ? Colors.red : Colors.grey,
      ),
    );
  }

  Widget _buildFavoriteButton(BuildContext context, bool isFav) {
    return Expanded(
      child: CustomButton(
        onTap: isFav
            ? null
            : () {
                context.read<HomeCubit>().toggleFavorite(product);
                product.isFavorite.value = true;
                showToast(
                  context,
                  'تمت الإضافة إلى المفضلة بنجاح',
                  color: AppColors.kButtonPrimary,
                  icon: Icons.favorite,
                );
              },
        text: isFav ? 'تمت الإضافة' : 'إضافة إلى المفضلة',
        color: isFav ? Colors.grey.shade400 : AppColors.kButtonPrimary,
      ),
    );
  }
}
