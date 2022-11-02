import 'package:flutter/material.dart';
import 'package:flutter_starter/ui/theme/color.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static ThemeData get theme{
    return ThemeData.from(colorScheme: _lightColorScheme).copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(),
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevatedButtonThemeData,
      textButtonTheme: _textButtonThemeData,
    );
  }

  static final ColorScheme _lightColorScheme = ColorScheme(
      primary: AppColors.md_theme_light_primary,
      primaryContainer: AppColors.md_theme_light_primaryContainer,
      onPrimaryContainer: AppColors.md_theme_light_onPrimaryContainer,
      secondary: AppColors.md_theme_light_secondary,
      surface: AppColors.md_theme_light_surface,
      background: AppColors.md_theme_light_background,
      error: AppColors.md_theme_light_error,
      onPrimary: AppColors.md_theme_light_onPrimary,
      onSecondary: AppColors.md_theme_light_onSecondary,
      onSurface: AppColors.md_theme_light_onSurface,
      onBackground: AppColors.md_theme_light_onBackground,
      onError: AppColors.md_theme_light_onError,
      brightness: Brightness.light);

  static final InputDecorationTheme _inputDecorationTheme =
  InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    isDense: true,
  );

  static final ElevatedButtonThemeData _elevatedButtonThemeData =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 2
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
  );

  static final TextButtonThemeData _textButtonThemeData = TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
  );
}

