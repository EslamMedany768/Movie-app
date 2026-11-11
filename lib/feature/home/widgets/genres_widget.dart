import 'package:flutter/cupertino.dart';


import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';


class GenresWidget extends StatelessWidget {
  String text;
   GenresWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.075,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),

      child: Text(
        text,
        style: AppStyle.white20RobotoRegular.copyWith(fontSize: 16),
      ),
    );
  }
}
