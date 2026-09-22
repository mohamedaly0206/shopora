import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

abstract class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.whiteColor,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.blackColor,
      error: AppColors.errorColor,
      onError: AppColors.whiteColor,
      surface: AppColors.whiteColor,
      onSurface: AppColors.blackColor,
      tertiary: AppColors.successColor,
      onTertiary: AppColors.placeHolderColor,
    ),

    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: AppTextStyles.textStyleMedium20.copyWith(
        color: AppColors.blackColor,
      ),
      titleSpacing: 8,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.placeHolderColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.whiteColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.errorColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.errorColor),
      ),
      hintStyle: AppTextStyles.textStyleRegular14.copyWith(
        color: AppColors.secondaryColor,
      ),
      labelStyle: AppTextStyles.textStyleMedium12.copyWith(
        color: AppColors.greyColor,
      ),
      errorStyle: AppTextStyles.textStyleRegular14.copyWith(
        color: AppColors.errorColor,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style:
          ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.whiteColor,
            elevation: 0,
            textStyle: AppTextStyles.textStyleMedium16,
            disabledBackgroundColor: AppColors.primaryColor.withValues(
              alpha: 0.6,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ).copyWith(
            side: WidgetStateProperty.resolveWith<BorderSide?>((states) {
              if (states.contains(WidgetState.disabled)) {
                return const BorderSide(color: Colors.transparent);
              }

              return const BorderSide(color: AppColors.primaryColor);
            }),
          ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: AppColors.whiteColor,
        foregroundColor: AppColors.primaryColor,
        textStyle: AppTextStyles.textStyleMedium16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(color: AppColors.primaryColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
        textStyle: AppTextStyles.textStyleBold16,
      ),
    ),

    textTheme: const TextTheme(
      titleLarge: AppTextStyles.textStyleMedium20,
      titleMedium: AppTextStyles.textStyleMedium18,
      titleSmall: AppTextStyles.textStyleBold12,

      headlineLarge: AppTextStyles.textStyleSemiBold20,
      headlineMedium: AppTextStyles.textStyleMedium16,
      headlineSmall: AppTextStyles.textStyleRegular13,

      bodyLarge: AppTextStyles.textStyleRegular16,
      bodyMedium: AppTextStyles.textStyleRegular14,
      bodySmall: AppTextStyles.textStyleRegular12,

      labelLarge: AppTextStyles.textStyleRegular24,
      labelMedium: AppTextStyles.textStyleRegular20,
      labelSmall: AppTextStyles.textStyleMedium13,

      displayLarge: AppTextStyles.textStyleMedium14,
      displaySmall: AppTextStyles.textStyleMedium12,
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      indicatorColor: AppColors.secondaryColor,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: const WidgetStatePropertyAll(
        AppTextStyles.textStyleMedium14,
      ),
    ),
  );
}
