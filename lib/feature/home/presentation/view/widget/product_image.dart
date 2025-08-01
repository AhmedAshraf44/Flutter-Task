import 'package:flutter/material.dart';
import 'package:kartngo_task/core/constants/app_color.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Center(
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.kAccentOrange, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 30,
                bottom: 20,
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported,
                        size: 0, color: Colors.grey);
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 2,
          right: 8,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.kAccentOrange, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Image.asset(
                  'assets/images/burger_king.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
