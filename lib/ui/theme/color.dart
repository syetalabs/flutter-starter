import 'package:flutter/material.dart';

class AppColors {
  static Color md_theme_light_primary = const Color(0xFFF2D95C);
  static Color md_theme_light_onPrimary = const Color(0xFFffffff);
  static Color md_theme_light_primaryContainer = const Color(0xFFFFFDF6);
  static Color md_theme_light_onPrimaryContainer = const Color(0xFF151515);
  static Color md_theme_light_secondary = const Color(0xFF713E30);
  static Color md_theme_light_onSecondary = const Color(0xFFffffff);
  static Color md_theme_light_secondaryContainer = const Color(0xFFffdad5);
  static Color md_theme_light_onSecondaryContainer = const Color(0xFF410002);
  static Color md_theme_light_tertiary = const Color(0xFF713E30);
  static Color md_theme_light_onTertiary = const Color(0xFFffffff);
  static Color md_theme_light_tertiaryContainer = const Color(0xffffdbc6);
  static Color md_theme_light_onTertiaryContainer = const Color(0xFF331200);
  static Color md_theme_light_error = const Color(0xFFba1b1b);
  static Color md_theme_light_errorContainer = const Color(0xFFFFFDF6);
  static Color md_theme_light_onError = const Color(0xFFffffff);
  static Color md_theme_light_onErrorContainer = const Color(0xFF410001);
  static Color md_theme_light_background = const Color(0xFFFFFDF6);
  static Color md_theme_light_onBackground = const Color(0xFF211a19);
  static Color md_theme_light_surface = const Color(0xFFFFFDF6);
  static Color md_theme_light_onSurface = const Color(0xFF211a19);
  static Color md_theme_light_surfaceVariant = const Color(0xFFf4ddda);
  static Color md_theme_light_onSurfaceVariant = const Color(0xFF534341);
  static Color md_theme_light_outline = const Color(0xFF857371);
  static Color md_theme_light_inverseOnSurface = const Color(0xFFfbeeec);
  static Color md_theme_light_inverseSurface = const Color(0xFF362f2e);

  static Color md_theme_dark_primary = const Color(0xFFffb3a9);
  static Color md_theme_dark_onPrimary = const Color(0xFF680003);
  static Color md_theme_dark_primaryContainer = const Color(0xFF930007);
  static Color md_theme_dark_onPrimaryContainer = const Color(0xFFFFFDF6);
  static Color md_theme_dark_secondary = const Color(0xffffb3aa);
  static Color md_theme_dark_onSecondary = const Color(0xFF680005);
  static Color md_theme_dark_secondaryContainer = const Color(0xFF93000c);
  static Color md_theme_dark_onSecondaryContainer = const Color(0xFFffdad5);
  static Color md_theme_dark_tertiary = const Color(0xFFffb689);
  static Color md_theme_dark_onTertiary = const Color(0xFF542200);
  static Color md_theme_dark_tertiaryContainer = const Color(0xFF763300);
  static Color md_theme_dark_onTertiaryContainer = const Color(0xFFffdbc6);
  static Color md_theme_dark_error = const Color(0xFFffb4a9);
  static Color md_theme_dark_errorContainer = const Color(0xFF930006);
  static Color md_theme_dark_onError = const Color(0xFF680003);
  static Color md_theme_dark_onErrorContainer = const Color(0xFFFFFDF6);
  static Color md_theme_dark_background = const Color(0xFF211a19);
  static Color md_theme_dark_onBackground = const Color(0xFFede0de);
  static Color md_theme_dark_surface = const Color(0xFF211a19);
  static Color md_theme_dark_onSurface = const Color(0xFFede0de);
  static Color md_theme_dark_surfaceVariant = const Color(0xFF534341);
  static Color md_theme_dark_onSurfaceVariant = const Color(0xFFd8c2bf);
  static Color md_theme_dark_outline = const Color(0xFFa08c8a);
  static Color md_theme_dark_inverseOnSurface = const Color(0xFF211a19);
  static Color md_theme_dark_inverseSurface = const Color(0xFFede0de);

  static Color red = const Color(0xFFFF0000);
  static Color maroon = const Color(0xFF820606);
  static Color blue = const Color(0xFF0066FF);
  static Color darkBlue = const Color(0xFF054AB1);
  static Color green = const Color(0xFF84BC42);

  static Color inProgress = const Color(0xFFFDA50F);
  static Color completed = const Color(0xFF0B6623);
  static Color canceled = const Color(0xFFC21807);

  static Color primaryContainer(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? md_theme_light_primaryContainer
        : md_theme_dark_primaryContainer;
  }

  static Color onPrimaryContainer(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? md_theme_light_onPrimaryContainer
        : md_theme_dark_onPrimaryContainer;
  }

  static Color error(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? md_theme_light_error
        : md_theme_dark_error;
  }

  static Color onError(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? md_theme_light_onError
        : md_theme_dark_onError;
  }
}
