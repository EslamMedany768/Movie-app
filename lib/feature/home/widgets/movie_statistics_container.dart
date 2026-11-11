import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';


class MovieStatisticsContainer extends StatelessWidget {
  IconData? icon;
  String text;

  MovieStatisticsContainer({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.055, vertical: 8),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: AppColors.grey,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: AppColors.orange, size: 30),
          SizedBox(width: size.width * 0.03),
          Text(text, style: AppStyle.white24BoldRoboto),
        ],
      ),
    );
  }
}
