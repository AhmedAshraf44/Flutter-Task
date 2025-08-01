import 'package:flutter/material.dart';

import '../../../../../core/constants/app_color.dart';
import '../../../../../core/style/app_style.dart';

class BuildCategoryChips extends StatefulWidget {
  const BuildCategoryChips({super.key, required this.categories});
  final List<String> categories;
  @override
  State<BuildCategoryChips> createState() => _BuildCategoryChipsState();
}

class _BuildCategoryChipsState extends State<BuildCategoryChips> {
  int _selectedIndex = 0; // To manage selected category chip

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.categories.length, (index) {
          final isSelected = _selectedIndex == index;
          final label = widget.categories[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              checkmarkColor: AppColors.kTextPrimary,
              label: Text(
                label,
                style: AppStyles.textStyle14Bold.copyWith(
                  color: isSelected
                      ? AppColors.kTextSecondary
                      : AppColors.kTextPrimary,
                ),
              ),
              selected: isSelected,
              selectedColor: AppColors
                  .kBackgroundButtonSecondary, // Blue color for selected chip
              backgroundColor: AppColors.kBackgroundButton,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? AppColors.kBackgroundButtonSecondary
                      : AppColors.kBackgroundButton,
                  width: 1,
                ),
              ),
              onSelected: (selected) {
                if (selected) {
                  setState(() => _selectedIndex = index);
                }
              },
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
            ),
          );
        }),
      ),
    );
  }
}
