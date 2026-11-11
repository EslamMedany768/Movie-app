import 'package:flutter/material.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/feature/home/tabs/1-home_screen/movie_details_screen.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';



class CardMovieWidget extends StatelessWidget {
  MovieEntity movie;
  double vertical;
  double horizontal;

  CardMovieWidget({super.key, required this.movie,this.vertical=3,this.horizontal=5});

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
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                ),
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
                    "${movie.voteAverage!.toDouble().toStringAsFixed(1)}",
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
