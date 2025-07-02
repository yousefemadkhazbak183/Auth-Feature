import 'package:auth_feature/core/routing/routers.dart';
import 'package:auth_feature/feature/forget_password/screen/forget_password_screen.dart';
import 'package:auth_feature/feature/sign_in/screen/sign_in_screen.dart';
import 'package:auth_feature/feature/sign_up/presentation/screen/sign_up_screen.dart';
import 'package:auth_feature/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routers.signUpRouter:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routers.signInRouter:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Routers.homeRouter:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routers.forgetPasswordRouter:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Center(child: Text('Error Screen')),
        );
    }
  }
}
