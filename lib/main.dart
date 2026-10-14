import 'package:flutter/material.dart';
import 'package:movies_app/feature/onboarding_screen/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

import 'feature/onboarding_screen/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (context) => OnboardingProvider(),
      child: MaterialApp(
        initialRoute: OnboardingScreen.routeName,
        routes: {OnboardingScreen.routeName: (context) => OnboardingScreen()},
      ),
    );
  }
}
