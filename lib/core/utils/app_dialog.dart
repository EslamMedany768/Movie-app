import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_style.dart';

class AppDialog {
  static showAlertDialog(
    BuildContext context,
  String title,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(24),
          backgroundColor: AppColors.black,
          title: Text(title, style: AppStyle.orange14Regular,textAlign: TextAlign.center,),
        );
      },
    );
  }

  static showLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          title: Center(
            child: CircularProgressIndicator(color: AppColors.orange),
          ),
        );
      },
    );
  }

  static hideDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
