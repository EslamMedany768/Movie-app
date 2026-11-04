import 'package:flutter/material.dart';
import 'package:movies_app/feature/home/tabs/3-explore_screen/widgets/custom_tab_bar_widget.dart';
import 'package:movies_app/feature/home/widgets/card_movie_widget.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_style.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.black,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.09,
              child: DefaultTabController(
                length: 5,
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  onTap: (value) {
                    selectedIndex = value;
                    print(value);
                    setState(() {});
                  },
                  labelPadding: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  overlayColor: WidgetStateColor.transparent,
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  tabs: [
                    CustomTabBarWidget(index: 0, selectedIndex: selectedIndex),
                    CustomTabBarWidget(index: 1, selectedIndex: selectedIndex),
                    CustomTabBarWidget(index: 2, selectedIndex: selectedIndex),
                    CustomTabBarWidget(index: 3, selectedIndex: selectedIndex),
                    CustomTabBarWidget(index: 4, selectedIndex: selectedIndex),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.66,
                ),
                padding: EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  return CardMovieWidget(imagePath: "assets/images/black_widow_boster.png");
                },
              ),
            ),SizedBox(height: size.height*0.07)
          ],
        ),
      ),
    );
  }
}
