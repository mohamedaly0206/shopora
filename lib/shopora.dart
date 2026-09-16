import 'package:flutter/material.dart';
import 'package:shopora/core/routes/app_routers.dart';
import 'package:shopora/core/routes/app_routes.dart';

class Shopora extends StatelessWidget {
  const Shopora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.signInScreen,
      onGenerateRoute: AppRouters.generateRoute,
    );
  }
}
