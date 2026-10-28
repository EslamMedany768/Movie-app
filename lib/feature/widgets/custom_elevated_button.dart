import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_style.dart';

class CustomElevatedButton extends StatelessWidget {
  bool isPrefix;
  String iconPath;
  Color bgColor;
  String text;
  void Function()? function;

  CustomElevatedButton({
    super.key,
    required this.text,
    this.isPrefix = false,
     this.iconPath="",
    required this.bgColor,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
        ),
      ),
      onPressed: () {},
      child: isPrefix
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(AssetImage(iconPath),color: AppColors.black,size:26,),
                SizedBox(width: 8,),
                Text(text, style: AppStyle.grey20Regular),
              ],
            )
          : Text(text, style: AppStyle.grey20Regular),
    );
  }
}
