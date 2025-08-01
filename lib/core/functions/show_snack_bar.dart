import 'package:flutter/material.dart';

import '../constants/app_color.dart';

showSnackBar(
  context, {
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: AppColors.kButtonPrimary,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
