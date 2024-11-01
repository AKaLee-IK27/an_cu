import "package:flutter/material.dart";

import "app_colors.dart";

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle headline = const TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    color: AppColors.secondary,
  );

  static TextStyle title = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColors.secondary,
  );

  static TextStyle bodyBold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.secondary,
  );

  static TextStyle body = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  );

  static TextStyle caption = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  );
}
