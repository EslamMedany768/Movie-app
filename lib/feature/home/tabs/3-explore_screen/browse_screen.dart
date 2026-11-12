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

  late BrowseScreenViewModel browseScreenViewModel;
  late DefaultTabBarProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialFunc();
  }

  initialFunc() async {

      browseScreenViewModel = BlocProvider.of<BrowseScreenViewModel>(
        context,
        listen: false,
      );
      provider = Provider.of<DefaultTabBarProvider>(context, listen: false);
      await browseScreenViewModel.getGenreList();

      if (browseScreenViewModel.isEmpty){
        browseScreenViewModel.getSpecificMovies(
          browseScreenViewModel.genreList![provider.selectedIndex].id.toString(),
        );}

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                      genreList:browseScreenViewModel.genreList!,
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
            child: BlocBuilder<BrowseScreenViewModel, BrowseScreenStates>(
              builder: (context, state) {
                if (state is GetGenreListSuccessState) {
                  return GridView.builder(
                    itemCount: browseScreenViewModel.genreMovies!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.66,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (context, index) {
                      return CardMovieWidget(
                        movie: browseScreenViewModel.genreMovies![index],
                      );
                    },
                  );
                } else if (state is DiscoverMoviesGetSpecificMoviesErrorState) {
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
