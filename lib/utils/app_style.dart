
import 'package:flutter/material.dart';

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
  static TextStyle white20Regular = TextStyle(
    color: AppColors.white.withOpacity(.6),
    fontSize: 20,
    fontWeight: FontWeight.w400,
    
  );
  static TextStyle black20SemiBold = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
}
