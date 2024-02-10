import 'package:book_ai/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepOrange, // Set your primary color
        accentColor: Colors.deepOrange, // Set your accent color
      ),
      canvasColor: AppColors.primaryColor,
      focusColor: AppColors.primaryColor, // Main color
      disabledColor: AppColors.translucentColor,
      primaryColor: AppColors.secondaryColor, // Secondary color
      appBarTheme: AppBarTheme(
        color: Colors.transparent, // Transparent app bar
        elevation: 0, // No shadow
        iconTheme:
            const IconThemeData(color: AppColors.secondaryColor), // White icons
        titleTextStyle: GoogleFonts.quicksand(
          fontSize: 20.w,
          fontWeight: FontWeight.w600, // Semibold
          color: AppColors.secondaryColor,
        ),
      ),
      textTheme: TextTheme(
        // button: GoogleFonts.quicksand(fontSize:15, fontWeight: FontWeight.w600, color: AppColors.primaryColor,),
        headlineLarge: GoogleFonts.quicksand(
          fontSize: 20.w,
          fontWeight: FontWeight.w600, // Semibold
          color: AppColors.secondaryColor,
        ),
        headlineMedium: GoogleFonts.quicksand(
          fontSize: 18.w,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryColor,
        ),
        headlineSmall: GoogleFonts.quicksand(
          fontSize: 12.w,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
        bodyLarge: GoogleFonts.quicksand(
          fontSize: 15.w,
          fontWeight: FontWeight.normal, // Regular
          color: AppColors.secondaryColor,
        ),
        bodyMedium: GoogleFonts.quicksand(
          fontSize: 12.w,
          fontWeight: FontWeight.w600, // Regular
          color: AppColors.secondaryColor,
        ),
        bodySmall: GoogleFonts.quicksand(
            fontSize: 15.w,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor),
        labelLarge: GoogleFonts.quicksand(
          fontSize: 15.w,
          fontWeight: FontWeight.bold, // Bold
          color: AppColors.secondaryColor,
        ),
        labelSmall: GoogleFonts.quicksand(
          fontSize: 12.w,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryColor,
        ),
        titleMedium: GoogleFonts.quicksand(
            fontSize: 16.w,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryColor),
        titleSmall: GoogleFonts.quicksand(
            fontSize: 12.w,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryColor),
      ),
    );
  }
}
