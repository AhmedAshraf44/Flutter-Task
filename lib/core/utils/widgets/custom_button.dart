import 'package:flutter/material.dart';
import 'package:kartngo_task/core/constants/app_color.dart';

import '../../style/app_style.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,required this.color,
  });

  final String text;
  final void Function()? onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: color ,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: AppStyles.textStyle16Bold
          ),
        ),
      ),
    );
  }
}
