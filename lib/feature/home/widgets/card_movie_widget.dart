import 'package:flutter/material.dart';
import 'package:movies_app/feature/home/tabs/1-home_screen/movie_details_screen.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_style.dart';

class CardMovieWidget extends StatelessWidget {
  String imagePath;
  double vertical;
  double horizontal;

  CardMovieWidget({super.key, required this.imagePath,this.vertical=3,this.horizontal=5});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(MovieDetailsScreen.routeName);
      },

      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: AppColors.black.withOpacity(.75),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "7.7",
                    style: AppStyle.white16Regular.copyWith(fontSize: 14),
                  ),
                  SizedBox(width: 2),
                  Icon(Icons.star, color: AppColors.orange, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
