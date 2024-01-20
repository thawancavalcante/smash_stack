import 'package:flutter/material.dart';
import 'package:smash/ui/theme/app_colors.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: 'Lexend',
    textTheme: TextTheme(
      labelLarge: ThemeData.light().textTheme.labelLarge!.copyWith(
            overflow: TextOverflow.ellipsis,
            color: AppColors.textColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
      labelMedium: ThemeData.light().textTheme.labelMedium!.copyWith(
            overflow: TextOverflow.ellipsis,
            color: AppColors.textColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
      labelSmall: ThemeData.light().textTheme.labelSmall!.copyWith(
            overflow: TextOverflow.ellipsis,
            color: AppColors.textColor,
            fontWeight: FontWeight.w400,
            fontSize: 10,
          ),
    ),
    primaryColor: AppColors.primaryColor,
    iconTheme: IconThemeData(
      color: Colors.grey[500],
      fill: 0,
      opticalSize: 24,
      weight: 300,
    ),
    primaryIconTheme: const IconThemeData(
      color: AppColors.textColor,
      fill: 0,
      opticalSize: 24,
      weight: 300,
    ),
    colorScheme: const ColorScheme(
      background: AppColors.backgroundColor,
      onBackground: AppColors.black,
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.black,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: AppColors.errorColor,
      onError: AppColors.white,
      surface: AppColors.surfaceColor,
      onSurface: AppColors.black,
    ),
  );
}
