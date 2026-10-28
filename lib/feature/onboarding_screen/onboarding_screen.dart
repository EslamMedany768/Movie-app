import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:movies_app/feature/onboarding_screen/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/onboarding_screen_reusble.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "onboarding_screen";

  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OnboardingProvider>(context);
    return Scaffold(body: provider.onBoardingScreensList[provider.index]);
  }
}
