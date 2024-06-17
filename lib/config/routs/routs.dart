import 'package:flutter/material.dart';
import 'package:he_dg/fetures/forget_password/presentation/pages/creat_password_screen.dart';
import 'package:he_dg/fetures/forget_password/presentation/pages/forget_password_screen.dart';
import 'package:he_dg/fetures/forget_password/presentation/pages/verification_screen.dart';
import 'package:he_dg/fetures/login/presentation/pages/login_screen.dart';
import 'package:he_dg/fetures/onboarding/presentation/pages/onboarding_screen.dart';

class AppRouts {
  static const String onboarding = "/";
  static const String login = "login";
  static const String forgetPassword = "forgetPassword";
  static const String createPasswordScreen = "createPassword";
  static const String verificationScreen = "VerificationScreen";
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouts.onboarding:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        );
      case AppRouts.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case AppRouts.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
        );
      case AppRouts.createPasswordScreen :
        return MaterialPageRoute(builder: (context) => CreatePasswordScreen(),);
      case AppRouts.verificationScreen:
        return MaterialPageRoute(builder: (context) => VerificationScreen(),);
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
