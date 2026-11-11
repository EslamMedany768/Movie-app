import 'package:flutter/cupertino.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';


class CastWidget extends StatelessWidget {
  const CastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(color: AppColors.grey,borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Row(
        children: [
          ClipRRect(child: Image.asset("assets/images/actor_image.png")),
          SizedBox(width: 10),
          Container(
            constraints: BoxConstraints(minHeight: size.height*0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name : Hayley Atwell",
                  style: AppStyle.white20RobotoRegular,
                ),
                Text(
                  "Character : Captain Carter",
                  style: AppStyle.white20RobotoRegular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
