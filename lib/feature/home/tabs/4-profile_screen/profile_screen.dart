import 'package:flutter/material.dart';
import 'package:movies_app/feature/home/tabs/4-profile_screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:movies_app/feature/widgets/custom_elevated_button.dart';


import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "profile_screen";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                            "assets/images/gamer 1.png",
                            height: size.height * 0.15,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "John Safwat",
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
                        Text("12", style: AppStyle.white36BoldRoboto),
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
                        onPressed: () {},
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
            initialIndex: 0,
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
                      "Watch List",
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
          child: Container(
            color: AppColors.black,
            child: Image.asset("assets/images/empty_icon.png"),
          ),
        ),
      ],
    );
  }
}
