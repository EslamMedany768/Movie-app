import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/feature/auth/login_screen/login_screen.dart';
import 'package:movies_app/feature/widgets/custom_elevated_button.dart';
import 'package:movies_app/feature/widgets/custom_text_button.dart';
import 'package:movies_app/feature/widgets/custom_text_field.dart';
import 'package:movies_app/providers/language_provider.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_style.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  List<String> images = [
    "assets/images/gamer 1.png",
    "assets/images/gamer 2.png",
    "assets/images/gamer 3.png",
  ];

  static const String routeName = "register_screen";

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late String imagePicked;
    var languageProvider = Provider.of<LanguageProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.orange),
        title: Text(
          "Register",
          style: AppStyle.orange14Regular.copyWith(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(images[index]);
                },

                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    imagePicked = images[index];
                  },
                  initialPage: 0,
                  enlargeCenterPage: true,
                  enlargeFactor: 1 / 2.3,
                  viewportFraction: 1 / 3,
                  enableInfiniteScroll: true,
                  height: size.height * 0.18,

                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                textAlign: TextAlign.center,
                "Avatar",
                style: AppStyle.orange14Regular.copyWith(
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              CustomTextField(text: "Name", prefixIcon: Icons.person),
              SizedBox(height: size.height * 0.02),
              CustomTextField(text: "Email", prefixIcon: Icons.email),
              SizedBox(height: size.height * 0.02),
              CustomTextField(text: "Password", prefixIcon: Icons.person),
              SizedBox(height: size.height * 0.02),
              CustomTextField(
                text: "Confirm Password",
                prefixIcon: Icons.person,
              ),
              SizedBox(height: size.height * 0.02),
              CustomTextField(text: "Phone Number", prefixIcon: Icons.person),
              SizedBox(height: size.height * 0.025),
              CustomElevatedButton(
                text: "Create Account",
                bgColor: AppColors.orange,
                function: () {},
              ),
              SizedBox(height: size.height * 0.015),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Already Have Account ? "),
                      TextSpan(
                        text: "Login",
                        style: AppStyle.orange14Regular.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(
                              context,
                            ).pushNamed(LoginScreen.routeName);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.015),
              Localizations.override(
                context: context,
                locale: Locale("en"),
                child: Center(
                  child: SizedBox(
                    height: 48,
                    child: CustomSlidingSegmentedControl(
                      thumbDecoration: BoxDecoration(
                        color: AppColors.orange,
                        border: Border.all(color: AppColors.orange),
                        borderRadius: BorderRadius.all(Radius.circular(64)),
                      ),

                      customSegmentSettings: CustomSegmentSettings(),
                      innerPadding: EdgeInsets.symmetric(horizontal: 0),

                      padding: 8,
                      initialValue: 1,
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: AppColors.orange),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(64)),
                      ),
                      children: const {
                        1: ClipRRect(
                          child: Image(
                            image: AssetImage("assets/images/usa.png"),
                          ),
                        ),
                        2: ClipRRect(
                          child: Image(
                            image: AssetImage("assets/images/EG.png"),
                          ),
                        ),
                      },
                      onValueChanged: (value) {
                        value == 1
                            ? languageProvider.changeLang("en")
                            : languageProvider.changeLang("ar");
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.015),
            ],
          ),
        ),
      ),
    );
  }
}
