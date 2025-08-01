import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/style/app_style.dart';

class BuildTotalDisplay extends StatelessWidget {
  const BuildTotalDisplay({super.key, required this.total});
  final double total;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${total.toStringAsFixed(2)} ',
          style: AppStyles.textStyle18Bold.copyWith(
            color: AppColors.kTextOnDark,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          'SAR',
          style: AppStyles.textStyle14Bold.copyWith(
            color: AppColors.kTextOnDark,
            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}