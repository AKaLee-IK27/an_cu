import 'package:an_cu/Utils/Styles/app_themes.dart';
import 'package:an_cu/Views/Home/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      home: const HomeScreen(),
    );
  }
}
