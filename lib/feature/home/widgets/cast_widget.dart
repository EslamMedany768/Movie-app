import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/domain/entity/CastResponseEntity.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';

class CastWidget extends StatelessWidget {
  CastEntity actor;

  CastWidget({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
            child: Image.network(
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return CircularProgressIndicator(color: AppColors.orange);
                }
              },
              errorBuilder: (context, error, stackTrace) => Text("Not Found"),
              alignment: AlignmentGeometry.topCenter,
              height: size.height * 0.1,
              width: size.width * 0.2,
              fit: BoxFit.cover,
              "https://image.tmdb.org/t/p/w500/${actor.profilePath}",
            ),
          ),
          SizedBox(width: 10),
          Container(
            constraints: BoxConstraints(minHeight: size.height * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.6,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "Name : ${actor.originalName}",
                    style: AppStyle.white20RobotoRegular,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.6,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "Character : ${actor.character}",
                    style: AppStyle.white20RobotoRegular,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
