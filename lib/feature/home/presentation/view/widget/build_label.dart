import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/style/app_style.dart';

class BuildLabel extends StatelessWidget {
  const BuildLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.arrow_back_ios, color: AppColors.kTextOnDark, size: 24),
        const SizedBox(width: 5),
        Text(
          'عرض السلة',
          style: AppStyles.textStyle18Bold.copyWith(color: AppColors.kTextOnDark),
        ),
      ],
    );
  }
}