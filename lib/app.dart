import 'package:an_cu/Utils/Styles/app_themes.dart';
import 'package:an_cu/Views/Onboarding/onboarding_screen.dart';
import 'package:an_cu/Views/Home/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  final bool onboarding;
  const MainApp({super.key, this.onboarding = false});
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.light,
      home: onboarding ? const HomeScreen() : const OnboardingScreen(),
    );
  }
}
