import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/core/utils/firebase_utils.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/domain/use_cases/add_movie_to_history_use_case.dart';
import 'package:movies_app/feature/home/tabs/4-profile_screen/cubit/profile_screen_view_model.dart';
import 'package:movies_app/feature/home/tabs/4-profile_screen/cubit/profile_states.dart';
import 'package:movies_app/feature/home/tabs/movie_details/movie_details_screen.dart';
import 'package:movies_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../di/di.dart';

class CardMovieWidget extends StatelessWidget {
  MovieEntity movie;
  double vertical;
  double horizontal;

  CardMovieWidget({
    super.key,
    required this.movie,
    this.vertical = 3,
    this.horizontal = 5,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(movie: movie),
          ),
        );
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
              padding: EdgeInsets.symmetric(
                vertical: vertical,
                horizontal: horizontal,
              ),
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
