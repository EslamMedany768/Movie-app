import 'package:flutter/material.dart';
import 'package:movies_app/feature/home/widgets/card_movie_widget.dart';
import 'package:movies_app/feature/home/widgets/cast_widget.dart';
import 'package:movies_app/feature/home/widgets/movie_statistics_container.dart';
import 'package:movies_app/feature/home/widgets/genres_widget.dart';
import 'package:movies_app/feature/widgets/custom_elevated_button.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_style.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = "movie_details_screen";

  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> genres = [
      "action",
      "Sci-Fi",
      "Adventure",
      "Fantasy",
      "Horror",
    ];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.692,
              child: Stack(
                children: [
                  Image.asset(
                    width: double.infinity,
                    "assets/images/Doctor_Strange_image.png",
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
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: ImageIcon(
                              AssetImage("assets/images/arrow_back_icon.png"),
                              color: AppColors.white,
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
                  Center(
                    child: InkWell(
                      onTap: () {
                        ///todo:play video
                      },
                      child: Image.asset("assets/images/play_icon.png"),
                    ),
                  ),
                  Positioned(
                    bottom: size.height * 0.06,
                    right: 0,
                    left: 0,
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Doctor Strange in the Multiverse of Madness",
                        style: AppStyle.white24BoldRoboto,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: size.height * 0.009,
                    right: 0,
                    left: 0,
                    child: Text(
                      "2022",
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
                      style: AppStyle.white24BoldRoboto.copyWith(fontSize: 20),
                      text: "Watch",
                      bgColor: AppColors.red,
                      function: () {},
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MovieStatisticsContainer(
                        icon: Icons.favorite,
                        text: "15",
                      ),
                      MovieStatisticsContainer(
                        icon: Icons.watch_later,
                        text: "90",
                      ),
                      MovieStatisticsContainer(icon: Icons.star, text: "7.6"),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text("Screen Shots", style: AppStyle.white24BoldRoboto),
                  SizedBox(height: 8),

                  ///todo:do map to convert list of images to widgets of image.assets
                  SizedBox(height: 16),
                  Text("Similar", style: AppStyle.white24BoldRoboto),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: size.height * 0.32,
                        width: size.width * 0.44,
                        child: CardMovieWidget(
                          vertical: 5,
                          horizontal: 7,
                          imagePath: "assets/images/Doctor_Strange_image.png",
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.32,
                        width: size.width * 0.44,
                        child: CardMovieWidget(
                          vertical: 5,
                          horizontal: 7,
                          imagePath: "assets/images/Doctor_Strange_image.png",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: size.height * 0.32,
                        width: size.width * 0.44,
                        child: CardMovieWidget(
                          vertical: 5,
                          horizontal: 7,
                          imagePath: "assets/images/Doctor_Strange_image.png",
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.32,
                        width: size.width * 0.44,
                        child: CardMovieWidget(
                          vertical: 5,
                          horizontal: 7,
                          imagePath: "assets/images/Doctor_Strange_image.png",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text("Summary", style: AppStyle.white24BoldRoboto),
                  SizedBox(height: 8),
                  Text(
                    "Following the events of Spider-Man No W"
                    "ay Home, Doctor Strange unwittingly cast"
                    "s a forbidden spell that accidentally opens up the"
                    " multiverse. With help from Wong and Scarlet Witch, Strang"
                    "e confronts various versions of himself as well as teaming "
                    "up with the young America Chavez while traveling through various"
                    " realities and working to restore reality as he knows it. Along "
                    "the way, Strange and his allies realize they must take on a powerf"
                    "ul new adversary who seeks to take over the multiverse.—Blazer3"
                    "46",
                    style: AppStyle.white20RobotoRegular.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text("Cast", style: AppStyle.white24BoldRoboto),
                  SizedBox(height: 8),
                  CastWidget(),
                  SizedBox(height: 8),
                  CastWidget(),
                  SizedBox(height: 8),
                  CastWidget(),
                  SizedBox(height: 8),
                  CastWidget(),
                  SizedBox(height: 16),
                  Text("Genres", style: AppStyle.white24BoldRoboto),
                  SizedBox(height: 8),
                  Center(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 11,
                      alignment: WrapAlignment.start,
                      children: genres.map((e) {
                        return GenresWidget(text: e);
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: size.height * 0.06),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
