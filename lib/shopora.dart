import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shopora/core/routes/app_routers.dart';
import 'package:shopora/core/routes/app_routes.dart';
import 'package:shopora/core/theme/theme.dart';
import 'package:shopora/l10n/app_localizations.dart';

class Shopora extends StatelessWidget {
  const Shopora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.appTheme,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: AppRoutes.signInScreen,
      onGenerateRoute: AppRouters.generateRoute,
    );
  }
}
