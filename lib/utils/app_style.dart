import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppStyle {
  static TextStyle white24Bold = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static TextStyle white36Medium = TextStyle(
    color: AppColors.white,
    fontSize: 36,
    fontWeight: FontWeight.w500,
  );
  static TextStyle white20RegularOpacity60 = TextStyle(
    color: AppColors.white.withOpacity(.6),
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static TextStyle white16Regular = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle orange14Regular = TextStyle(
    color: AppColors.orange,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle grey20Regular = TextStyle(
    color: AppColors.grey,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static TextStyle black20SemiBold = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle white14Roboto = GoogleFonts.roboto(
    color: AppColors.white,
    fontSize: 14,
  );
}
