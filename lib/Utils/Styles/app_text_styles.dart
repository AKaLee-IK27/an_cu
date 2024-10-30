import "package:flutter/material.dart";

import "app_colors.dart";

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle headline = TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    color: AppColors.black80,
  );

  static TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.black80,
  );

  static TextStyle bodyTextBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black80,
  );

  static TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black80,
  );

  static TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.black80,
  );
}
