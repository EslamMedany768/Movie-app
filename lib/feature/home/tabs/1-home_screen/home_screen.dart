import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/feature/home/widgets/card_movie_widget.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.black,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.77,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/1917_war_movie_image.png",
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
                  child: Image.asset("assets/images/Available_Now_image.png"),
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
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: CardMovieWidget(
                          imagePath: "assets/images/1917_war_movie_image.png",
                        ),
                      );
                    },

                    options: CarouselOptions(
                      height: size.height * 0.39,
                      viewportFraction: .55,
                      enlargeFactor: 0.27,
                      enlargeCenterPage: true,
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
                  separatorBuilder: (context, index) => SizedBox(width: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width * 0.325,
                      child: CardMovieWidget(
                        vertical: 2,
                        horizontal: 4,
                        imagePath: "assets/images/1917_war_movie_image.png",
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
  }
}
