import 'package:flutter/material.dart';
import 'package:movies_app/feature/widgets/custom_elevated_button.dart';
import 'package:movies_app/feature/widgets/custom_text_field.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_style.dart';

class ForgetPassScreen extends StatelessWidget {
  static const String routeName = "forget_pass_screen";

  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.orange),
        backgroundColor: AppColors.black,
        title: Text(
          AppLocalizations.of(context)!.forget_password,
          style: AppStyle.orange14Regular.copyWith(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/Forgot password Image.png",
              fit: BoxFit.fill,
            ),
            CustomTextField(text: AppLocalizations.of(context)!.email, prefixIcon: Icons.email),
            SizedBox(height: size.height * 0.03),
            CustomElevatedButton(
              text: AppLocalizations.of(context)!.verify_email,
              bgColor: AppColors.orange,
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}
