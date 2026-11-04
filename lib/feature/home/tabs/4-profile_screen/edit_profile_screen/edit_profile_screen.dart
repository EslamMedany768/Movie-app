import 'package:flutter/material.dart';
import 'package:movies_app/feature/widgets/custom_elevated_button.dart';
import 'package:movies_app/feature/widgets/custom_text_button.dart';
import 'package:movies_app/feature/widgets/custom_text_field.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_style.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = "edit_profile_screen";

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back, color: AppColors.orange),
        ),
        centerTitle: true,
        title: Text(
          "Pick Avatar",
          style: AppStyle.white16Regular.copyWith(color: AppColors.orange),
        ),
        backgroundColor: AppColors.black,
      ),
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/gamer 1.png",
                height: size.height * 0.2,
              ),
              SizedBox(height: size.height * 0.03),
              CustomTextField(text: "John Safwat", prefixIcon: Icons.person),
              SizedBox(height: size.height * 0.02),
              CustomTextField(text: "0120000000000", prefixIcon: Icons.phone),
              SizedBox(height: size.height * 0.008),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: CustomTextButton(
                  text: "Reset Password",
                  function: () {},
                  style: AppStyle.grey20Regular.copyWith(
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                ),
              ),
              Spacer(),
              CustomElevatedButton(
                text: "Delete Account",
                bgColor: Colors.red,
                style: AppStyle.white14Roboto.copyWith(fontSize: 20),
                function: () {},
              ),
              SizedBox(height: size.height * 0.02),
              CustomElevatedButton(
                text: "Update Data",
                style: AppStyle.white14Roboto.copyWith(
                  fontSize: 20,
                  color: AppColors.black,
                ),
                bgColor: Colors.orange,
                function: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
