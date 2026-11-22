import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_dialog.dart';
import 'package:movies_app/core/utils/firebase_utils.dart';
import 'package:movies_app/data/model/UserDm.dart';
import 'package:movies_app/feature/home/tabs/1-home_screen/home_screen.dart';
import 'package:movies_app/feature/widgets/custom_elevated_button.dart';
import 'package:movies_app/feature/widgets/custom_text_field.dart';
import 'package:movies_app/providers/language_provider.dart';
import 'package:movies_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../di/di.dart';
import '../../../l10n/app_localizations.dart';
import '../../home/home.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register_screen";

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseUtils firebaseUtils=getIt<FirebaseUtils>();

String? imagePicked;
  var key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: "eslam");
  TextEditingController emailController = TextEditingController(
    text: "eslam@gmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "ssssss",
  );
  TextEditingController rePasswordController = TextEditingController(
    text: "ssssss",
  );
  TextEditingController phoneNumberController = TextEditingController(
    text: "01202359489",
  );
  List<String> images = [
    "assets/images/gamer 1.png",
    "assets/images/gamer 2.png",
    "assets/images/gamer 3.png",
    "assets/images/gamer 4.png",
    "assets/images/gamer 5.png",
    "assets/images/gamer 6.png",
    "assets/images/gamer 7.png",
    "assets/images/gamer 8.png",
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.black,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.orange),
        title: Text(
          AppLocalizations.of(context)!.register,
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
                  return Image.asset(
                    images[index],
                    width: size.width * 0.4,
                    fit: BoxFit.contain,
                  );
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
                AppLocalizations.of(context)!.avatar,
                style: AppStyle.orange14Regular.copyWith(
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Form(
                key: key,
                child: Column(
                  children: [
                    CustomTextField(
                      validator: (value) {
                        if (value == null ||
                            value
                                .trim()
                                .isEmpty ||
                            value.length < 2) {
                          return "Enter Valid Name";
                        } else if (value.length > 14) {
                          return "Name is too large";
                        } else {
                          return null;
                        }
                      },
                      controller: nameController,
                      text: AppLocalizations.of(context)!.name,

                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: size.height * 0.02),
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty) {
                          return "Enter Valid E-mail";
                        } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(value)) {
                          return "Enter Valid E-mail";
                        } else {
                          return null;
                        }
                      },
                      text: AppLocalizations.of(context)!.email,
                      prefixIcon: Icons.email,
                    ),
                    SizedBox(height: size.height * 0.02),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value
                            .trim()
                            .isEmpty) {
                          return "Enter Valid Password";
                        } else if (value.length < 5) {
                          return "Password is too weak";
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      text: AppLocalizations.of(context)!.password,
                      isObscure: true,
                      isSuffix: true,
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: size.height * 0.02),
                    CustomTextField(
                      validator: (value) {
                        if (value != passwordController.text) {
                          return "Not Same Password";
                        } else {
                          return null;
                        }
                      },
                      controller: rePasswordController,
                      text: AppLocalizations.of(context)!.confirm_password,
                      isObscure: true,
                      isSuffix: true,
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: size.height * 0.02),
                    CustomTextField(
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null ||
                            value
                                .trim()
                                .isEmpty ||
                            value.length != 11) {
                          return "Enter Valid Phone Number";
                        } else {
                          return null;
                        }
                      },
                      controller: phoneNumberController,
                      text: AppLocalizations.of(context)!.phone_number,
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: size.height * 0.025),
                  ],
                ),
              ),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.create_account,
                bgColor: AppColors.orange,
                function: () async {
                  if (key.currentState!.validate()) {
                    try {
                      AppDialog.showLoading(context);
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      firebaseUtils.addUserToFireStore(
                        UserDm(
                            id: credential.user!.uid,
                            email: credential.user!.email,
                            name: nameController.text,
                            phone: phoneNumberController.text,
                            image: imagePicked ?? images[0]
                        ),
                      );
                      firebaseUtils.getUserFromFireStore(
                        credential.user!.uid,
                      ).then((value) {
                        if (value != null) {
                          provider.updateUser(value);
                        }
                      });
                      AppDialog.hideDialog(context);
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(Home.routeName);

                      ///todo: add credential user to user Model & add it in fireStore
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        AppDialog.hideDialog(context);
                        AppDialog.showAlertDialog(
                          context,
                          'The password provided is too weak.',
                        );
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        AppDialog.hideDialog(context);
                        AppDialog.showAlertDialog(
                          context,
                          'The account already exists for that email.',
                        );
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  }
                },
              ),

              SizedBox(height: size.height * 0.015),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                        "${AppLocalizations.of(context)!
                            .already_have_account} ",
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.login,
                        style: AppStyle.orange14Regular.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pop();
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
                      initialValue: languageProvider.currentLang == "en"
                          ? 1
                          : 2,
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
