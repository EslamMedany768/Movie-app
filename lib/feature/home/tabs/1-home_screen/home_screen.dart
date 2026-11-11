import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/data/data_source/remote_data_source_impl/home_remote_data_source_impl.dart';
import 'package:movies_app/data/model/MovieDm.dart';
import 'package:movies_app/data/repository/home_repository_impl.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies_app/feature/home/tabs/1-home_screen/cubit/home_screen_states.dart';
import 'package:movies_app/feature/home/tabs/1-home_screen/cubit/home_screen_view_model.dart';
import 'package:movies_app/feature/home/widgets/card_movie_widget.dart';
import 'package:movies_app/providers/change_bg_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/api/api_constant.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ChangeBgProvider>(context, listen: false).selectedIndex = 0;
    BlocProvider.of<HomeScreenViewModel>(context).getPopularMovies();
    BlocProvider.of<HomeScreenViewModel>(context).getSpecificMovies("28");
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<HomeScreenViewModel>(context);
    var provider = Provider.of<ChangeBgProvider>(context);
    var size = MediaQuery.of(context).size;
    return BlocBuilder(
      bloc: BlocProvider.of<HomeScreenViewModel>(context),
      builder: (context, state) {
        if (state is GetMoviesSuccessState) {
          return Container(
            color: AppColors.black,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: size.height * 0.77,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500/${state.response.results![provider.selectedIndex].posterPath}",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.black.withOpacity(.8),
                                AppColors.black.withOpacity(.6),
                                AppColors.black,
                              ],
                              begin: AlignmentGeometry.topCenter,
                              end: AlignmentGeometry.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -10,
                        right: 0,
                        left: 0,
                        child: Image.asset(
                          "assets/images/Available_Now_image.png",
                        ),
                      ),
                      Positioned(
                        bottom: 6,
                        right: 0,
                        left: 0,
                        child: Image.asset("assets/images/Watch_Now_image.png"),
                      ),
                      Positioned(
                        top: size.height * 0.15,
                        left: 0,
                        right: 0,
                        child: CarouselSlider.builder(
                          itemCount: state.response.results!.length,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              child: CardMovieWidget(
                                movie: state.response.results![index],
                              ),
                            );
                          },

                          options: CarouselOptions(
                            height: size.height * 0.39,
                            viewportFraction: .55,
                            enlargeFactor: 0.27,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              provider.changeBG(index);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text("Action", style: AppStyle.white20RobotoRegular),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            ///todo:Navigate to browse_screen
                          },
                          child: Row(
                            children: [
                              Text(
                                "See More ",
                                style: AppStyle.white20RobotoRegular.copyWith(
                                  color: AppColors.orange,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: AppColors.orange,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: size.height * 0.23,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.response.results!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: size.width * 0.325,
                            child: CardMovieWidget(
                              vertical: 2,
                              horizontal: 4,
                              movie:
                                  state.response.results![index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.1),
                ],
              ),
            ),
          );
        } else if (state is GetPopularMoviesErrorState) {
          return Text("error", style: AppStyle.white20RobotoRegular);
        } else {
          return Center(
            child: CircularProgressIndicator(color: AppColors.white),
          );
        }
      },
    );
  }
}
