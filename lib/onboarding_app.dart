import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/core/resources/app_colors.dart';
import 'package:onboarding_winter_project/core/resources/app_text_styles.dart';
import 'package:onboarding_winter_project/core/router/app_router.dart';
import 'package:onboarding_winter_project/core/router/routes.dart';

class OnboardingApp extends StatelessWidget {
  const OnboardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryColor,
        fontFamily: AppTextStyles.fontFamily,
      ),
    );
  }
}
