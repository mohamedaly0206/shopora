import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopora/config/di/di.dart';
import 'package:shopora/core/routes/app_routes.dart';
import 'package:shopora/features/auth/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:shopora/features/auth/sign_in/presentation/ui/sign_in_screen.dart';
import 'package:shopora/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:shopora/features/auth/sign_up/presentation/ui/sign_up_screen.dart';
import 'package:shopora/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:shopora/features/auth/forget_password/presentation/ui/forget_password_screen.dart';
import 'package:shopora/features/home/presentation/ui/home_screen.dart';

abstract class AppRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signInScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignInCubit>(),
            child: const SignInScreen(),
          ),
        );
      case AppRoutes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case AppRoutes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
