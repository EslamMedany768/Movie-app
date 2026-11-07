import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/feature/auth/login_screen/login_screen.dart';
import 'package:movies_app/feature/auth/register_screen/register_screen.dart';
import 'package:movies_app/feature/home/tabs/1-home_screen/movie_details_screen.dart';
import 'package:movies_app/feature/onboarding_screen/provider/onboarding_provider.dart';
import 'package:movies_app/providers/language_provider.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'feature/auth/forget_pass_screen/forget_pass_screen.dart';
import 'feature/home/home.dart';
import 'feature/home/tabs/4-profile_screen/edit_profile_screen/edit_profile_screen.dart';
import 'feature/home/tabs/4-profile_screen/profile_screen.dart';
import 'feature/onboarding_screen/onboarding_screen.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnboardingProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android:FadeForwardsPageTransitionsBuilder(backgroundColor: AppColors.black),
            TargetPlatform.iOS:ZoomPageTransitionsBuilder(
              backgroundColor: AppColors.black,
            ),
            // CupertinoPageTransitionsBuilder()
            // PredictiveBackPageTransitionsBuilder(fallbackColor: AppColors.black)
            // PredictiveBackFullscreenPageTransitionsBuilder(
            //     fallbackColor: AppColors.black)
            // OpenUpwardsPageTransitionsBuilder()
            // FadeUpwardsPageTransitionsBuilder()


          },
        ),
      ),
      locale: Locale(Provider.of<LanguageProvider>(context).currentLang),
      localizationsDelegates: [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: LoginScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        ForgetPassScreen.routeName: (context) => ForgetPassScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        Home.routeName: (context) => Home(),
        EditProfileScreen.routeName: (context) => EditProfileScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
      },
    );
  }
}
