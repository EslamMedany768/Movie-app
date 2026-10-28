import 'package:flutter/material.dart';
import 'package:movies_app/feature/auth/login_screen/login_screen.dart';

import '../../widgets/onboarding_screen_reusble.dart';

class OnboardingProvider extends ChangeNotifier {
  int index = 0;
  List<OnboardingScreenReusable> onBoardingScreensList = [
    OnboardingScreenReusable(
      isFirstScreen: true,
      image: "assets/images/onboarding_screen1.png",
      title: "Find Your Next\nFavorite Movie Here",
      isNegativeButton: false,
      positiveButtonName: "Explore Now",
      description:
          "Get access to a huge librar"
          "y of movies to suit all tastes. You will surely like it.",
    ),
    OnboardingScreenReusable(
      title: "Discover Movies",
      isNegativeButton: false,
      description:
          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
      image: "assets/images/onboarding_screen2.png",
    ),
    OnboardingScreenReusable(
      title: "Explore All Genres",
      isNegativeButton: true,
      description:
          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
      image: "assets/images/onboarding_screen3.png",
    ),
    OnboardingScreenReusable(
      title: "Create Watchlists",
      isNegativeButton: true,
      description:
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
      image: "assets/images/onboarding_screen4.png",
    ),
    OnboardingScreenReusable(
      title: "Rate, Review, and Learn",
      isNegativeButton: true,
      description:
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
      image: "assets/images/onboarding_screen5.png",
    ),
    OnboardingScreenReusable(
      title: "Start Watching Now",
      isNegativeButton: true,
      positiveButtonName: "Finish",
      negativeButtonName: "Back",
      isDescription: false,
      image: "assets/images/onboarding_screen6.png",
    ),
  ];

  incrementIndex(BuildContext context) {
    if (index < 5) {
      index++;
    } else {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }

    notifyListeners();
  }

  decrementIndex() {
    if (index > 0) {
      index--;
    }
    notifyListeners();
  }
}
