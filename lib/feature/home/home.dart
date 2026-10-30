import 'package:flutter/material.dart';
import 'package:movies_app/feature/home/tabs/1-home_screen/home_screen.dart';
import 'package:movies_app/feature/home/tabs/2-search_screen/search_screen.dart';
import 'package:movies_app/feature/home/tabs/3-explore_screen/explore_screen.dart';
import 'package:movies_app/feature/home/tabs/4-profile_screen/profile_screen.dart';
import 'package:movies_app/utils/app_colors.dart';

class Home extends StatefulWidget {
  List<Widget> Screens = [
    HomeScreen(),
    SearchScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];
  static const String routeName = "home";

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: widget.Screens[selectedIndex],
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: DefaultTabController(

          initialIndex: selectedIndex,
          length: 4,
          child: TabBar(
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },

            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            unselectedLabelColor: AppColors.white,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            labelPadding: EdgeInsets.symmetric(vertical: 12),
            tabs: [
              ImageIcon(
                AssetImage("assets/images/home_icon.png"),
                size: 24,
                color: selectedIndex == 0 ? AppColors.orange : AppColors.white,
              ),
              ImageIcon(
                AssetImage("assets/images/search_icon.png"),
                size: 22,
                color: selectedIndex == 1 ? AppColors.orange : AppColors.white,
              ),
              ImageIcon(
                AssetImage("assets/images/explore_icon.png"),
                size: 22,
                color: selectedIndex == 2 ? AppColors.orange : AppColors.white,
              ),
              ImageIcon(
                AssetImage("assets/images/Profile_icon.png"),
                size: 22,
                color: selectedIndex == 3 ? AppColors.orange : AppColors.white,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
