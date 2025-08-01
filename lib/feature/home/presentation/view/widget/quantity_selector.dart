import 'package:flutter/material.dart';
import 'package:kartngo_task/core/constants/app_color.dart';
import 'package:kartngo_task/core/style/app_style.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.quantityNotifier,
    required this.price,
    required this.onIncrement,
    required this.onDecrement,
  });

  final ValueNotifier<int> quantityNotifier;
  final double price;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '${price.toStringAsFixed(2)} S...',
            // Assuming S... is currency
            overflow: TextOverflow.ellipsis,
            style: AppStyles.textStyle14Bold.copyWith(
              color: AppColors.kTextSecondary,
              fontSize: 12,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.kBackgroundQuantityBox, // Light blue background
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.remove,
                    size: 20, color: Color(0xFFA1A6AA)),
                onPressed: onDecrement,
                constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                padding: EdgeInsets.zero,
                splashRadius: 20,
              ),
              ValueListenableBuilder<int>(
                valueListenable: quantityNotifier,
                builder: (context, value, _) {
                  return Text(
                    '$value',
                    style: AppStyles.textStyle14Bold.copyWith(fontSize: 12),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 20,
                  color: AppColors.kTextSecondary,
                ),
                onPressed: onIncrement,
                constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                padding: EdgeInsets.zero,
                splashRadius: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
