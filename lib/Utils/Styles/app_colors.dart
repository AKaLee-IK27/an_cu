import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const primary = Color(0xFFE4002B);
  static const primarySwatch= MaterialColor(
    0xFFE4002B,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFF44336),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );
  static const secondary = Color(0xFF234F68);

  static const white = Color(0xFFFFFFFF);

  static const black = Color(0xFF000000);
  static final black20 = const Color(0xFF000000).withOpacity(0.2);
  static final black50 = const Color(0xFF000000).withOpacity(0.5);
  static final black80 = const Color(0xFF000000).withOpacity(0.8);

  static const grayBG = Color(0xFFF4F4F4);

  static const gray = Color(0xFF9C9C9C);
  static final gray5 = const Color(0xFF9C9C9C).withOpacity(0.05);
  static final gray10 = const Color(0xFF9C9C9C).withOpacity(0.1);

  static const star = Color(0xFFF2C94C);
}
