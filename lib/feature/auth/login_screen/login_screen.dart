import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/feature/auth/forget_pass_screen/forget_pass_screen.dart';
import 'package:movies_app/feature/auth/register_screen/register_screen.dart';
import 'package:movies_app/feature/widgets/custom_elevated_button.dart';
import 'package:movies_app/feature/widgets/custom_text_button.dart';
import 'package:movies_app/feature/widgets/custom_text_field.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/providers/language_provider.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_style.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login_screen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/splash_screen_icon_android12.png",
                  width: double.infinity,
                  height: size.height * 0.3,
                ),
                CustomTextField(text: "Email", prefixIcon: Icons.email),
                SizedBox(height: size.height * 0.02),
                CustomTextField(
                  text: "Password",
                  prefixIcon: Icons.lock,
                  isSuffix: true,
                ),
                SizedBox(height: size.height * 0.001),
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child:
                      ///Custom textButton
                      CustomTextButton(
                        style: AppStyle.orange14Regular,
                        text: "Forget Password ?",
                        function: () {
                          Navigator.of(
                            context,
                          ).pushNamed(ForgetPassScreen.routeName);
                        },
                      ),
                ),
                SizedBox(height: size.height * 0.02),

                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.login,
                  bgColor: AppColors.orange,
                  function: () {},
                ),
                SizedBox(height: size.height * 0.04),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don’t Have Account ?",
                          style: AppStyle.white14Roboto,
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(
                                context,
                              ).pushNamed(RegisterScreen.routeName);
                            },
                          text: " Create One",

                          style: AppStyle.white14Roboto.copyWith(
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.orange,
                        thickness: 1.1,
                        indent: 60,
                        endIndent: 12,
                      ),
                    ),
                    Text(
                      "OR",
                      style: AppStyle.white14Roboto.copyWith(fontSize: 15),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.orange,
                        thickness: 1.1,
                        indent: 12,
                        endIndent: 60,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.025),
                CustomElevatedButton(
                  text: "Login With Google",
                  isPrefix: true,
                  iconPath: "assets/images/icon _google_.png",
                  bgColor: AppColors.orange,
                  function: () {
                    ///todo: Integrated with firebase
                  },
                ),
                SizedBox(height: size.height * 0.025),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
