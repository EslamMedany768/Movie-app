import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/home/tabs/2-search_screen/cubit/search_states.dart';
import 'package:movies_app/feature/home/tabs/2-search_screen/cubit/search_view_model.dart';
import 'package:movies_app/feature/home/widgets/card_movie_widget.dart';
import 'package:movies_app/feature/widgets/custom_text_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<SearchViewModel>(context);
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.black,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                function: (value) {
                  viewModel.doSearch(value);
                },
                text: "Search",
                prefixIcon: Icons.search,
                controller: viewModel.controller,
              ),
              SizedBox(height: size.height*0.015,),
              BlocBuilder<SearchViewModel, SearchStates>(
                builder: (context, state) {
                  if (state is SearchSuccessState) {
                    return state.moviesResponse.results!.isNotEmpty
                        ? Expanded(
                          child:GridView.builder(
                            itemCount: state.moviesResponse.results!.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 8,
                              childAspectRatio: 0.66,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            itemBuilder: (context, index) {
                              return CardMovieWidget(
                                movie: state.moviesResponse.results![index],
                              );
                            },
                          )

                        )
                        : Expanded(
                            child: Image.asset("assets/images/empty_icon.png"),
                          );
                  }
                  else if (state is SearchErrorState) {
                    return Center(
                      child: Text(
                        state.error,
                        style: AppStyle.white20RobotoRegular,
                      ),
                    );
                  } else if(state is SearchLoadingState){
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.orange,
                        ),
                      ),
                    );
                  }else {
                    return Expanded(
                      child: Image.asset("assets/images/empty_icon.png"),
                    );
                  }
                },
              ),
              SizedBox(height: size.height*0.1,)

            ],
          ),
        ),
      ),
    );
  }
}
