import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_style.dart';


class CustomTabBarWidget extends StatelessWidget {
  int selectedIndex;
  int index;

  CustomTabBarWidget({
    super.key,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: index == selectedIndex
            ? Border.all(color: AppColors.orange, width: 2)
            : Border.all(color: AppColors.orange, width: 2),
        color: index == selectedIndex ? AppColors.orange : AppColors.black,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Text(
        "Action",
        style: index == selectedIndex
            ? AppStyle.black20SemiBold.copyWith(fontWeight: FontWeight.bold)
            : AppStyle.black20SemiBold.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.orange,
              ),
      ),
    );
  }
}
