import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/feature/auth/login_screen/login_screen.dart';
import 'package:movies_app/feature/auth/register_screen/register_screen.dart';
import 'package:movies_app/feature/home/tabs/1-home_screen/cubit/home_screen_view_model.dart';
import 'package:movies_app/feature/home/tabs/2-search_screen/cubit/search_view_model.dart';
import 'package:movies_app/feature/home/tabs/4-profile_screen/cubit/profile_screen_view_model.dart';
import 'package:movies_app/feature/home/tabs/movie_details/cubit/movie_details_view_model.dart';
import 'package:movies_app/feature/home/tabs/movie_details/cubit/similar_movie_view_model.dart';
import 'package:movies_app/feature/home/tabs/3-explore_screen/cubit/browse_screen_view_model.dart';
import 'package:movies_app/feature/onboarding_screen/provider/onboarding_provider.dart';
import 'package:movies_app/providers/app_bar_provider.dart';
import 'package:movies_app/providers/change_bg_provider.dart';
import 'package:movies_app/providers/discover_tab_bar_provider.dart';
import 'package:movies_app/providers/language_provider.dart';
import 'package:movies_app/providers/navigate_screens_provider.dart';
import 'package:movies_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'core/utils/app_colors.dart';
import 'di/di.dart';
import 'feature/auth/forget_pass_screen/forget_pass_screen.dart';
import 'feature/home/home.dart';
import 'feature/home/tabs/4-profile_screen/edit_profile_screen/edit_profile_screen.dart';
import 'feature/home/tabs/4-profile_screen/profile_screen.dart';
import 'feature/onboarding_screen/onboarding_screen.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

void main() async{
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<BrowseScreenViewModel>()),
        BlocProvider(create: (context) => getIt<ProfileViewModel>()),
        BlocProvider(create: (context) => getIt<SearchViewModel>(),),
        BlocProvider(create: (context) => getIt<HomeScreenViewModel>()),
        BlocProvider(create: (context) => getIt<MovieDetailsViewModel>()),
        BlocProvider(create: (context) => getIt<SimilarMovieViewModel>(),)
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserProvider(),),
          ChangeNotifierProvider(create: (context) => ChangeBgProvider()),
          ChangeNotifierProvider(
            create: (context) => NavigateScreensProvider(),
          ),
          ChangeNotifierProvider(create: (context) => DiscoverTabBarProvider()),
          ChangeNotifierProvider(create: (context) => AppBarProvider()),
          ChangeNotifierProvider(create: (context) => OnboardingProvider()),
          ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ],
        child: MyApp(),
      ),
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
            TargetPlatform.android: FadeForwardsPageTransitionsBuilder(
              backgroundColor: AppColors.black,
            ),
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(
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
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
