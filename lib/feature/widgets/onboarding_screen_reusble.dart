import 'package:flutter/material.dart';
import 'package:movies_app/feature/onboarding_screen/onboarding_screen.dart';
import 'package:movies_app/feature/onboarding_screen/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_style.dart';


class OnboardingScreenReusable extends StatefulWidget {
  bool isFirstScreen;
  String positiveButtonName;
  bool isNegativeButton;
  String title;
  String negativeButtonName;
  String? description;
  String image;
  bool isDescription;

  OnboardingScreenReusable({
    super.key,
    this.isFirstScreen=false,
    this.isNegativeButton = false,
    this.positiveButtonName = "Next",
    required this.title,
    this.description,
    required this.image,
    this.negativeButtonName = "Back",
    this.isDescription = true,
  });

  @override
  State<OnboardingScreenReusable> createState() =>
      _OnboardingScreenReusableState();
}

class _OnboardingScreenReusableState extends State<OnboardingScreenReusable> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OnboardingProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Image.asset(widget.image),
          ),
          widget.isFirstScreen?Positioned(
            bottom: 14,
            right: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                SizedBox(height: size.height * 0.036),
                Text(
                  widget.title,
                  style: AppStyle.white36Medium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.025),
                widget.isDescription
                    ? Text(
                  widget.description!,
                  style: AppStyle.white20RegularOpacity60,
                  textAlign: TextAlign.center,
                )
                    : SizedBox(),
                SizedBox(height: size.height * 0.025),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () {
                      provider.incrementIndex(context);
                    },
                    child: Text(
                      widget.positiveButtonName,
                      style: AppStyle.black20SemiBold,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.021),

              ],
            ),
          ):
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(

              decoration: BoxDecoration(color: AppColors.black,borderRadius: BorderRadius.only(topRight: Radius.circular(38),
                  topLeft: Radius.circular(38))),
              width: double.infinity,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  SizedBox(height: size.height * 0.030),
                  Text(
                    widget.title,
                    style: AppStyle.white24Bold,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.008),
                  widget.isDescription
                      ? Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
                    child: Text(


                            widget.description!,
                            style: AppStyle.white20RegularOpacity60,
                            textAlign: TextAlign.center,
                          ),
                      )
                      : SizedBox(),
                  SizedBox(height: size.height * 0.020),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: AppColors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        provider.incrementIndex(context);
                      },
                      child: Text(
                        widget.positiveButtonName,
                        style: AppStyle.black20SemiBold,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.021),
                  widget.isNegativeButton
                      ? Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                          ).copyWith(bottom: 16),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              backgroundColor: AppColors.black,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: AppColors.orange,
                                  width: 2,
                                ),
                                borderRadius: BorderRadiusGeometry.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            onPressed: () {
                              provider.decrementIndex();
                            },
                            child: Text(
                              widget.negativeButtonName,
                              style: AppStyle.black20SemiBold.copyWith(
                                color: AppColors.orange,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
