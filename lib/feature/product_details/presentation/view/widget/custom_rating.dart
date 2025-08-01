import 'package:flutter/material.dart';
import 'package:kartngo_task/core/constants/app_color.dart';
class CustomRating extends StatelessWidget {
   CustomRating({
    super.key,
    required this.size,
    this.rating = 4,
    this.maxRating = 5,
    Color? activeColor,
    Color? inactiveColor,
  })  : activeColor = activeColor ?? AppColors.kAccentOrange,
        inactiveColor = inactiveColor ?? const Color(0xffCCCCCC);
  final double size;
  final int rating;
  final int maxRating;
  final Color activeColor;
  final Color inactiveColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        maxRating,
            (index) => Icon(
          Icons.star,
          size: size,
          color: index < rating ? activeColor : inactiveColor,
        ),
      ),
    );
  }
}
