import 'package:flutter/material.dart';

import '../../../../../core/style/app_style.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'لا توجد منتجات في السلة',
        style: AppStyles.textStyle18Bold,
      ),
    );
  }
}