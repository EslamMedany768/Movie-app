import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/core/utils/firebase_utils.dart';
import 'package:movies_app/domain/entity/MoviesEntity.dart';
import 'package:movies_app/feature/home/home.dart';
import 'package:movies_app/feature/home/tabs/1-home_screen/home_screen.dart';
import 'package:movies_app/feature/home/tabs/4-profile_screen/cubit/profile_screen_view_model.dart';
import 'package:movies_app/feature/home/tabs/movie_details/cubit/movie_details_states.dart';
import 'package:movies_app/feature/home/tabs/movie_details/cubit/movie_details_view_model.dart';
import 'package:movies_app/feature/home/tabs/movie_details/cubit/similar_movie_states.dart';
import 'package:movies_app/feature/home/tabs/movie_details/cubit/similar_movie_view_model.dart';
import 'package:movies_app/feature/home/widgets/card_movie_widget.dart';
import 'package:movies_app/feature/home/widgets/cast_widget.dart';
import 'package:movies_app/feature/home/widgets/movie_statistics_container.dart';
import 'package:movies_app/feature/home/widgets/genres_widget.dart';
import 'package:movies_app/feature/widgets/custom_elevated_button.dart';
import 'package:movies_app/providers/app_bar_provider.dart';
import 'package:movies_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';
import '../4-profile_screen/cubit/profile_states.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const String routeName = "movie_details_screen";
  MovieEntity movie;

  MovieDetailsScreen({super.key, required this.movie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late MovieDetailsViewModel movieDetailsViewModel;
  late SimilarMovieViewModel similarMovieViewModel;
  late AppBarProvider appBarProvider;
  late UserProvider userProvider;

  @override
  void initState() {
    // TODO: implement initState
    movieDetailsViewModel = BlocProvider.of<MovieDetailsViewModel>(context);
    similarMovieViewModel = BlocProvider.of<SimilarMovieViewModel>(context);
    appBarProvider = Provider.of<AppBarProvider>(context, listen: false)
      ..isAppBarVisible = true;
    userProvider = Provider.of<UserProvider>(context, listen: false);
    movieDetailsViewModel.getMovieDetails(widget.movie.id!.toInt());
    movieDetailsViewModel.getScreenShots(widget.movie.id!.toInt());
    similarMovieViewModel.getSimilarMovies(widget.movie.id!.toInt());
    movieDetailsViewModel.getCastOfMovie(widget.movie.id!.toInt());
    BlocProvider.of<ProfileViewModel>(
      context,
    ).addMovieToHistory(userProvider.currentUser!, widget.movie);
  }

  @override
  Widget build(BuildContext context) {
    appBarProvider = Provider.of<AppBarProvider>(context);
    List<String> genres = [
      "action",
      "Sci-Fi",
      "Adventure",
      "Fantasy",
      "Horror",
    ];
    var size = MediaQuery.of(context).size;
    return BlocListener<ProfileViewModel, ProfileHistoryStates>(
      listener: (context, state) {
        if (state is ProfileAddMovieToHistorySuccessStates) {
          Fluttertoast.showToast(msg: state.message);
        } else if (state is ProfileAddMovieToHistoryErrorStates) {
          Fluttertoast.showToast(msg: state.error);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: BlocBuilder<MovieDetailsViewModel, MovieDetailsStates>(
          builder: (context, state) {
            if (state is MovieDetailsSuccessState) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  if (notification.depth == 0) {
                    if (notification.direction == ScrollDirection.forward &&
                        !appBarProvider.isAppBarVisible) {
                      appBarProvider.updateAppBar(true);
                    } else if (notification.direction ==
                            ScrollDirection.reverse &&
                        appBarProvider.isAppBarVisible) {
                      appBarProvider.updateAppBar(false);
                    }
                  }
                  return false;
                },
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.692,
                            child: Stack(
                              children: [
                                Image.network(
                                  width: double.infinity,
                                  "https://image.tmdb.org/t/p/w500/${movieDetailsViewModel.movieDetailsResponse!.posterPath}",
                                  fit: BoxFit.fill,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.black.withOpacity(.2),
                                        AppColors.black,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),

                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      ///todo:play video
                                    },
                                    child: Image.asset(
                                      "assets/images/play_icon.png",
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: size.height * 0.06,
                                  right: 0,
                                  left: 0,
                                  child: Padding(
                                    padding: EdgeInsetsGeometry.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      movieDetailsViewModel
                                              .movieDetailsResponse!
                                              .title ??
                                          "",
                                      style: AppStyle.white24BoldRoboto,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: size.height * 0.009,
                                  right: 0,
                                  left: 0,
                                  child: Text(
                                    movieDetailsViewModel
                                        .movieDetailsResponse!
                                        .releaseDate!
                                        .substring(0, 4),
                                    style: AppStyle.silverGrey20BoldRoboto,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: CustomElevatedButton(
                                    style: AppStyle.white24BoldRoboto.copyWith(
                                      fontSize: 20,
                                    ),
                                    text: "Watch",
                                    bgColor: AppColors.red,
                                    function: () {},
                                  ),
                                ),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MovieStatisticsContainer(
                                      isVoteNumber: true,
                                      icon: Icons.favorite,
                                      text: movieDetailsViewModel
                                          .movieDetailsResponse!
                                          .voteCount
                                          .toString(),
                                    ),
                                    MovieStatisticsContainer(
                                      icon: Icons.watch_later,
                                      text: movieDetailsViewModel
                                          .movieDetailsResponse!
                                          .runtime
                                          .toString(),
                                    ),
                                    MovieStatisticsContainer(
                                      icon: Icons.star,
                                      text: movieDetailsViewModel
                                          .movieDetailsResponse!
                                          .voteAverage
                                          .toString()
                                          .substring(0, 3),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Text(
                                  "Screen Shots",
                                  style: AppStyle.white24BoldRoboto,
                                ),
                                SizedBox(height: 16),

                                ///todo:do map to convert list of images to widgets of image.assets
                                BlocBuilder<
                                  MovieDetailsViewModel,
                                  MovieDetailsStates
                                >(
                                  builder: (context, state) {
                                    if (state is MovieDetailsSuccessState) {
                                      return Column(
                                        spacing: size.height * 0.02,
                                        children: movieDetailsViewModel
                                            .screenShots!
                                            .map((e) {
                                              return Container(
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(16),
                                                      ),
                                                ),
                                                child: Image.network(
                                                  "https://image.tmdb.org/t/p/w500/${e.filePath!}",
                                                ),
                                              );
                                            })
                                            .toList(),
                                      );
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.orange,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                SizedBox(height: 16),
                                Text(
                                  "Similar",
                                  style: AppStyle.white24BoldRoboto,
                                ),
                                SizedBox(height: 8),
                                BlocBuilder<
                                  SimilarMovieViewModel,
                                  SimilarMovieStates
                                >(
                                  builder: (context, state) {
                                    if (state is SimilarMovieSuccessState) {
                                      return SizedBox(
                                        child: GridView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing:
                                                    size.width * 0.03,
                                                mainAxisSpacing:
                                                    size.height * 0.02,
                                                childAspectRatio: 1.1 / 1.6,
                                              ),
                                          itemCount: state.similarMovie.length,
                                          itemBuilder: (context, index) {
                                            return SizedBox(
                                              child: CardMovieWidget(
                                                movie:
                                                    state.similarMovie[index],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                      // return SizedBox(
                                      //   width: double.infinity,
                                      //   child: Wrap(
                                      //     spacing: size.width * 0.04,
                                      //     runSpacing: size.width * 0.04,
                                      //     alignment: WrapAlignment.center,
                                      //     children: state.similarMovie.map((e) {
                                      //       return SizedBox(
                                      //         height: size.height * 0.34,
                                      //         width: size.width * 0.439,
                                      //         child: CardMovieWidget(movie: e),
                                      //       );
                                      //     }).toList(),
                                      //   ),
                                      // );
                                    } else if (state
                                        is SimilarMovieErrorState) {
                                      return Center(child: Text(state.error));
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.orange,
                                        ),
                                      );
                                    }
                                  },
                                ),

                                SizedBox(height: 16),
                                Text(
                                  "Summary",
                                  style: AppStyle.white24BoldRoboto,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  movieDetailsViewModel
                                      .movieDetailsResponse!
                                      .overview!,
                                  style: AppStyle.white20RobotoRegular.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text("Cast", style: AppStyle.white24BoldRoboto),
                                SizedBox(height: 8),

                                BlocBuilder<
                                  MovieDetailsViewModel,
                                  MovieDetailsStates
                                >(
                                  builder: (context, state) {
                                    if (state is MovieDetailsSuccessState) {
                                      return Column(
                                        spacing: size.height * 0.02,
                                        children: movieDetailsViewModel
                                            .castResponse
                                            .map((e) {
                                              return CastWidget(actor: e);
                                            })
                                            .toList(),
                                      );
                                    } else if (state
                                        is MovieDetailsErrorState) {
                                      return Center(child: Text(state.error));
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.orange,
                                        ),
                                      );
                                    }
                                  },
                                ),

                                SizedBox(height: 16),
                                Text(
                                  "Genres",
                                  style: AppStyle.white24BoldRoboto,
                                ),
                                SizedBox(height: 8),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 11,
                                  alignment: WrapAlignment.start,
                                  children: movieDetailsViewModel
                                      .movieDetailsResponse!
                                      .genres!
                                      .map((e) {
                                        return GenresWidget(text: e.name!);
                                      })
                                      .toList(),
                                ),
                                SizedBox(height: size.height * 0.06),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.038,
                      right: 0,
                      left: 0,
                      child: AnimatedSlide(
                        offset: appBarProvider.isAppBarVisible
                            ? Offset.zero
                            : const Offset(0, -2),
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOutCubic,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: size.width * 0.1,
                                  maxHeight: size.height * 0.1,
                                ),

                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    overlayColor: Colors.transparent,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 12,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pushReplacementNamed(Home.routeName);
                                  },
                                  child: ImageIcon(
                                    AssetImage(
                                      "assets/images/arrow_back_icon.png",
                                    ),
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              ImageIcon(
                                AssetImage("assets/images/save_movie_icon.png"),
                                color: AppColors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is MovieDetailsErrorState) {
              return Center(
                child: Text(state.error, style: AppStyle.white20RobotoRegular),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(color: AppColors.orange),
              );
            }
          },
        ),
      ),
    );
  }
}
