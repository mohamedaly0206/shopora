import 'package:flutter/material.dart';
import 'package:shopora/core/routes/app_routes.dart';
import 'package:shopora/features/auth/sign_in/presentation/ui/sign_in_screen.dart';
import 'package:shopora/features/auth/sign_up/presentation/ui/sign_in_screen.dart';

abstract class AppRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case AppRoutes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      // case AppRoutes.forgetPasswordScreen:
      //   return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
