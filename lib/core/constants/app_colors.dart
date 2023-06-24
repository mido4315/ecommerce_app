import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFECE3D8);
  static const Color background2 = Color(0xFFE1C8A6);

  static const Color buttonDark = Color(0xFF996E50);
  static const Color card = Color(0xFFF1F1F1);
  static const Color buttonLight = Color(0xFFFFD081);
  static const Color text1 = Color(0xFF996E50);
  static const Color text2 = Color(0xFF624735);
  static const Color text3 = Color(0xFF2D211A);

  static const LinearGradient gradient = LinearGradient(
    colors: [
      Color(0xFFE6DCD1),
      Color(0xFFCEC0B4),
      Color(0xFFC3B3A4),
      Color(0xFFC9B9AC),
      Color(0xFFCFBFB2),
      Color(0xFFD1C3B6),
      Color(0xFFD6C8BD),
      Color(0xFFDFD2C9),
      Color(0xFFE2D8CE),
    ],
    stops: [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}