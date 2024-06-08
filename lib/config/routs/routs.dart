import 'package:flutter/material.dart';
import 'package:he_dg/fetures/onboarding/presentation/pages/onboarding_screen.dart';

class AppRouts {
  static const String onboarding = "/";
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouts.onboarding:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => ErrorScreen(),
        );
    }
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Error"),
      ),
    );
  }
}
