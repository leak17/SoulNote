import 'package:flutter/material.dart';

class ThemeColor {
  static ColorScheme colorScheme = const ColorScheme(
    primary: Color.fromARGB(255, 173, 173, 173),
    secondary: Color(0xFF8B9299),
    background: Color(0xFF161F28),
    surface: Color.fromARGB(255, 0, 0, 0),
    error: Color(0xFFB00020),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color.fromARGB(255, 218, 218, 218),
    onBackground: Color(0xFFFFFFFF),
    onSurface: Color(0xFFFFFFFF),
    onError: Color.fromARGB(255, 138, 2, 2),
    brightness: Brightness.light,
  );

  static Color mainColor = const Color(0xFF213A5C);
  static Color blueColor = const Color.fromARGB(255, 86, 143, 170);
  static Color yealowColor = const Color.fromARGB(255, 230, 176, 0);
  static Color successColor = const Color.fromARGB(255, 16, 139, 0);
  static Color transparentColor = Colors.transparent;
}
