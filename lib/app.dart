import 'package:an_cu/Utils/Styles/app_themes.dart';
import 'package:an_cu/Views/Home/Screens/Onboarding_Screen/Onboarding_screen.dart';
import 'package:an_cu/Views/Home/Screens/home_screen.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
class MainApp extends ConsumerWidget {
  const MainApp({super.key, required bool onboarding});
=======
class MainApp extends StatelessWidget {
  final bool onboarding;
  const MainApp({super.key, this.onboarding = false});
 
>>>>>>> parent of 9a99ac4 (Merge branch 'khoi' into Phat)

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
