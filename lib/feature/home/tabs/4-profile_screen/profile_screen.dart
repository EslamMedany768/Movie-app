import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/auth/login_screen/login_screen.dart';
import 'package:movies_app/feature/home/tabs/4-profile_screen/cubit/profile_screen_view_model.dart';
import 'package:movies_app/feature/home/tabs/4-profile_screen/cubit/profile_states.dart';
import 'package:movies_app/feature/home/tabs/4-profile_screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:movies_app/feature/home/widgets/card_movie_widget.dart';
import 'package:movies_app/feature/widgets/custom_elevated_button.dart';
import 'package:movies_app/providers/discover_tab_bar_provider.dart';
import 'package:movies_app/providers/navigate_screens_provider.dart';
import 'package:movies_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "profile_screen";

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileViewModel viewModel;
  late UserProvider userProvider;

  @override
  void initState() {  print("PROFILE INIT STATE");
    // TODO: implement initState
    super.initState();
    viewModel = BlocProvider.of<ProfileViewModel>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    viewModel.getMoviesHistory(userProvider.currentUser!);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    print("PROFILE DISPOSE");
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 16, right: 16, left: 16),
          color: AppColors.offBlack,
          height: size.height * 0.38,
          width: double.infinity,
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            userProvider.currentUser!.image ??
                                "assets/images/gamer 1.png",
                            height: size.height * 0.15,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          userProvider.currentUser!.name!,
                          style: AppStyle.white14Roboto.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("12", style: AppStyle.white36BoldRoboto),
                        SizedBox(height: 8),
                        Text("Wish List", style: AppStyle.white24BoldRoboto),
                      ],
                    ),
                    Column(
                      children: [
                        BlocBuilder<ProfileViewModel, ProfileHistoryStates>(
                          builder: (context, state) {
                            if (state is GetMovieHistorySuccessState) {
                              return Text(
                                state.moviesHistory.length.toString(),
                                style: AppStyle.white36BoldRoboto,
                              );
                            } else {
                              return CircularProgressIndicator(
                                color: AppColors.orange,
                              );
                            }
                          },
                        ),
                        SizedBox(height: 8),
                        Text("History", style: AppStyle.white24BoldRoboto),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.025),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        text: "Edit Profile",
                        bgColor: AppColors.orange,
                        function: () {
                          Navigator.of(
                            context,
                          ).pushNamed(EditProfileScreen.routeName);
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    SizedBox(
                      width: size.width * 0.31,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Provider.of<NavigateScreensProvider>(
                            context,
                            listen: false,
                          ).updateIndex(0);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginScreen.routeName,
                            (route) => false,
                          );
                          userProvider.currentUser = null;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Exit",
                              style: AppStyle.white16Regular.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.exit_to_app,
                              color: AppColors.white,
                              size: 26,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          color: AppColors.offBlack,
          child: DefaultTabController(
            initialIndex: 1,
            length: 2,
            child: TabBar(
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              labelPadding: EdgeInsets.only(bottom: 12),
              dividerColor: Colors.transparent,
              indicatorPadding: EdgeInsetsGeometry.symmetric(horizontal: -50),
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.orange, width: 3),
                ),
              ),
              indicatorColor: Colors.red,
              tabs: [
                Column(
                  children: [
                    Icon(Icons.list, color: AppColors.orange, size: 40),
                    Text(
                      "Watch List",
                      style: AppStyle.white14Roboto.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ImageIcon(
                      AssetImage("assets/images/Folder_icon.png"),
                      color: AppColors.orange,
                      size: 40,
                    ),
                    Text(
                      "History",
                      style: AppStyle.white14Roboto.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        ///todo: do logic here
        Expanded(
          child: BlocBuilder<ProfileViewModel, ProfileHistoryStates>(
            builder: (context, state) {
              if (state is GetMovieHistorySuccessState) {
                return state.moviesHistory.isEmpty?  Image.asset("assets/images/empty_icon.png"):GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.02,
                    vertical: size.height * 0.015,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: size.height * 0.018,
                    crossAxisSpacing: size.width * 0.04,
                    childAspectRatio: 1 / 1.34,
                  ),
                  itemCount: state.moviesHistory.length,
                  itemBuilder: (context, index) {

                    return SizedBox(
                      child: CardMovieWidget(movie: state.moviesHistory[index]),
                    );
                  },
                );
              } else if (state is GetMovieHistoryErrorState) {
                return Center(
                  child: Text(
                    state.error,
                    style: AppStyle.white20RobotoRegular,
                  ),
                );
              } else if (state is GetMovieHistoryLoadingState) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.orange),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.orange),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
