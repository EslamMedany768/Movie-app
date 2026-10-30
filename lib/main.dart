import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/feature/auth/login_screen/login_screen.dart';
import 'package:movies_app/feature/auth/register_screen/register_screen.dart';
import 'package:movies_app/feature/onboarding_screen/provider/onboarding_provider.dart';
import 'package:movies_app/providers/language_provider.dart';
import 'package:provider/provider.dart';

import 'feature/auth/forget_pass_screen/forget_pass_screen.dart';
import 'feature/home/home.dart';
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
      },
    );
  }
}
