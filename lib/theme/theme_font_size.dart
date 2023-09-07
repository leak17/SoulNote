import 'package:diary_journal/theme/theme_font.dart';
import 'package:flutter/material.dart';

class ThemeFontSize {
  static TextTheme get textTheme {
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 95,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        fontFamilyFallback: ThemeFont.fontFamilyFallback,
      ),
      displayMedium: TextStyle(
        fontSize: 59,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        fontFamilyFallback: ThemeFont.fontFamilyFallback,
      ),
      displaySmall: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        fontFamilyFallback: ThemeFont.fontFamilyFallback,
      ),
      headlineMedium: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        fontFamilyFallback: ThemeFont.fontFamilyFallback,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamilyFallback: ThemeFont.fontFamilyFallback,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        fontFamilyFallback: ThemeFont.fontFamilyFallback,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        fontFamilyFallback: ThemeFont.fontFamilyFallback,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        fontFamilyFallback: ThemeFont.fontFamilyFallback,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        fontFamilyFallback: ThemeFont.fontFamilyFallback,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        fontFamilyFallback: ThemeFont.fontFamilyFallback,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        fontFamilyFallback: ThemeFont.fontFamilyFallback,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        fontFamilyFallback: ThemeFont.fontFamilyFallback,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        fontFamilyFallback: ThemeFont.fontFamilyFallback,
      ),
    );
  }
}
