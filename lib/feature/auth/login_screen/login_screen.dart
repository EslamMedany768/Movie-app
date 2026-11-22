import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:movies_app/core/utils/app_dialog.dart';
import 'package:movies_app/di/di.dart';
import 'package:movies_app/feature/auth/forget_pass_screen/forget_pass_screen.dart';
import 'package:movies_app/feature/home/home.dart';
import 'package:movies_app/feature/home/tabs/1-home_screen/home_screen.dart';
import 'package:movies_app/feature/widgets/custom_elevated_button.dart';
import 'package:movies_app/feature/widgets/custom_text_button.dart';
import 'package:movies_app/feature/widgets/custom_text_field.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/providers/language_provider.dart';
import 'package:movies_app/providers/user_provider.dart';

import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/firebase_utils.dart';
import '../../../data/model/UserDm.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login_screen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseUtils firebaseUtils = getIt<FirebaseUtils>();
  var emailController = TextEditingController(text: "eslam@gmail.com");
  var passwordController = TextEditingController(text: "ssssss");
  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    Future<UserCredential?> signInWithGoogle() async {
      try {
        await GoogleSignIn.instance.initialize(
          serverClientId:
              '417995843889-20q3e3m6cqh31doecu90q1pd818a3qop.apps.googleusercontent.com',
        );
        final GoogleSignInAccount googleUser = await GoogleSignIn.instance
            .authenticate();
        var user = UserDm(
          id: googleUser.id,
          email: googleUser.email,
          name: googleUser.displayName,
          image: null,
          phone: null,
        );
        firebaseUtils.addUserToFireStore(user);
        firebaseUtils.getUserFromFireStore(user.id!).then((value) {
          provider.updateUser(value);
        });

        ///todo:getUserData

        final GoogleSignInAuthentication googleAuth = googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
        );
        Navigator.of(context).pushReplacementNamed(Home.routeName);
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } on FirebaseAuthException catch (e) {
        if (e.code !=
            "GoogleSignInException(code GoogleSignInExceptionCode.canceled, [16] Cancelled by user., null)") {
          AppDialog.showAlertDialog(context, e.toString());
          debugPrint("Firebase Error: $e");
        }

      }
    }
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
                Form(
                  key: key,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter Valid E-mail";
                          } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          ).hasMatch(value)) {
                            return "Enter Valid E-mail";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,

                        text: AppLocalizations.of(context)!.email,
                        prefixIcon: Icons.email,
                      ),
                      SizedBox(height: size.height * 0.02),
                      CustomTextField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter Valid Password";
                          } else if (value.length < 5) {
                            return "Password is too weak";
                          } else {
                            return null;
                          }
                        },
                        text: AppLocalizations.of(context)!.password,
                        prefixIcon: Icons.lock,
                        isSuffix: true,
                        isObscure: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.001),
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child:
                      ///Custom textButton
                      CustomTextButton(
                        style: AppStyle.orange14Regular,
                        text: AppLocalizations.of(context)!.forget_password,
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
                  function: () async {
                    if (key.currentState!.validate()) {
                      try {
                        AppDialog.showLoading(context);
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );

                        ///todo:getUserData
                        UserDm? user = await firebaseUtils.getUserFromFireStore(
                          credential.user!.uid,
                        );
                        provider.updateUser(user);

                        AppDialog.hideDialog(context);
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(Home.routeName);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          AppDialog.hideDialog(context);
                          AppDialog.showAlertDialog(
                            context,
                            'No user found for that email.',
                          );
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          AppDialog.hideDialog(context);
                          AppDialog.showAlertDialog(
                            context,
                            'Wrong password provided for that user.',
                          );
                          print('Wrong password provided for that user.');
                        } else if (e.code == 'invalid-credential') {
                          AppDialog.hideDialog(context);
                          AppDialog.showAlertDialog(
                            context,
                            'No user found for that email.\n Please Register',
                          );
                        } else {
                          AppDialog.hideDialog(context);
                          AppDialog.showAlertDialog(context, e.toString());
                          print(e.code);
                        }
                      }
                    }
                  },
                ),
                SizedBox(height: size.height * 0.04),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "${AppLocalizations.of(context)!.dont_have_acc} ",
                          style: AppStyle.white14Roboto,
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(
                                context,
                              ).pushNamed(RegisterScreen.routeName);
                            },
                          text: AppLocalizations.of(context)!.create_account,

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
                      AppLocalizations.of(context)!.or,
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
                  text: AppLocalizations.of(context)!.login_with_google,
                  isPrefix: true,
                  iconPath: "assets/images/icon _google_.png",
                  bgColor: AppColors.orange,
                  function: () async {
                    ///todo: Integrated with firebase

                    signInWithGoogle();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
