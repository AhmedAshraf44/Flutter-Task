import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_color.dart';
import '../style/app_style.dart';

ThemeData buildLightTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.kTextOnDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kBackgroundAppBar,
      titleTextStyle: AppStyles.textStyle20Bold,
      iconTheme: IconThemeData(color: AppColors.kTextPrimary),
    ),
    textTheme: GoogleFonts.cairoTextTheme(Theme
        .of(context)
        .textTheme),
  );
}