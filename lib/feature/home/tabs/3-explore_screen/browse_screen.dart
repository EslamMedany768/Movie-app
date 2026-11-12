import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/home/tabs/1-home_screen/cubit/home_screen_states.dart';
import 'package:movies_app/feature/home/tabs/1-home_screen/cubit/home_screen_view_model.dart';
import 'package:movies_app/feature/home/tabs/3-explore_screen/cubit/browse_screen_states.dart';
import 'package:movies_app/feature/home/tabs/3-explore_screen/cubit/browse_screen_view_model.dart';
import 'package:movies_app/feature/home/tabs/3-explore_screen/widgets/custom_tab_bar_widget.dart';
import 'package:movies_app/feature/home/widgets/card_movie_widget.dart';
import 'package:movies_app/providers/default_tab_bar_provider.dart';

import 'package:provider/provider.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<BrowseScreenViewModel>(context).getGenreList();



  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    BlocProvider.of<HomeScreenViewModel>(context).getSpecificMovies(
      "${BlocProvider.of<BrowseScreenViewModel>(context).genreList![
      Provider.of<DefaultTabBarProvider>(context).selectedIndex].id}",
    );
    return Container(
      color: AppColors.black,
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(
              height: size.height * 0.09,
              child: BlocBuilder<BrowseScreenViewModel, BrowseScreenStates>(
                builder: (context, state) {
                  if (state is GetGenreListSuccessState) {
                    return CustomTabBarWidget(
                      genreList: state.genreList.genres!,
                    );
                  } else if (state is GetGenreListErrorState) {
                    return Text(
                      state.error,
                      style: AppStyle.white20RobotoRegular,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(color: AppColors.white),
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
              builder: (context, state) {
                if (state is GetMoviesSuccessState) {
                  return GridView.builder(
                    itemCount: state.response.results!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.66,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (context, index) {
                      return CardMovieWidget(
                        movie: state.response.results![index],
                      );
                    },
                  );
                } else if (state is GetSpecificMoviesErrorState) {
                  return Text(
                    state.error,
                    style: AppStyle.white20RobotoRegular,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.white),
                  );
                }
              },
            ),
          ),
          SizedBox(height: size.height * 0.07),
        ],
      ),
    );
  }
}
