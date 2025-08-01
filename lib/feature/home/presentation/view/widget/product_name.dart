import 'package:flutter/material.dart';

import '../../../../../core/style/app_style.dart';

class ProductName extends StatelessWidget {
  const ProductName({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppStyles.textStyle18Bold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
