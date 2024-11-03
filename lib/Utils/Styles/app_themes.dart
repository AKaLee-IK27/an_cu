import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Roboto",
    splashColor: Colors.white,
    primaryColor: AppColors.primary,
    indicatorColor: AppColors.primary,
    brightness: Brightness.light,
    dividerColor: Colors.white54,
    textTheme: TextTheme(
      displayLarge: AppTextStyles.body,
      titleLarge: AppTextStyles.title,
      bodyMedium: AppTextStyles.body,
    ),
  );
}
