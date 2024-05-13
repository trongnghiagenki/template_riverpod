import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core.dart';

class AppThemes {
  AppThemes._();
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      scrolledUnderElevation: 0,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      background: AppColors.background,
    ),
    textTheme: GoogleFonts.interTextTheme(),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.outline, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.outline, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.outline, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: AppTypography.s16.copyWith(color: AppColors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
        disabledForegroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.outline,
        textStyle: AppTypography.s14.bold.copyWith(
          color: AppColors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        elevation: 3,
        minimumSize: const Size(double.infinity, 50),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.onSurface,
        disabledForegroundColor: AppColors.onSurface,
        textStyle: AppTypography.s14.bold.copyWith(
          color: AppColors.primary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: const EdgeInsets.symmetric(vertical: 12.5),
      labelStyle: AppTypography.s16.bold,
      unselectedLabelStyle: AppTypography.s16.bold,
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.disable,
      indicatorColor: AppColors.primary,
      dividerColor: AppColors.outline,
    ),
    dividerColor: AppColors.outline,
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(AppColors.white),
    ),
  );

  static final ThemeData onBackground = lightTheme.copyWith(
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      fillColor: AppColors.white,
      hoverColor: AppColors.white,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.outline, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.outline, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.outline, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    ),
  );
}
