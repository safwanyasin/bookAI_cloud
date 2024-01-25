import 'package:book_ai/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      focusColor: AppColors.primaryColor, // Main color
      disabledColor: AppColors.translucentColor,
      primaryColor: AppColors.secondaryColor, // Secondary color
      appBarTheme: AppBarTheme(
        color: Colors.transparent, // Transparent app bar
        elevation: 0, // No shadow
        iconTheme:
            const IconThemeData(color: AppColors.secondaryColor), // White icons
        titleTextStyle: GoogleFonts.quicksand(
          fontSize: 20,
          fontWeight: FontWeight.w600, // Semibold
          color: AppColors.secondaryColor,
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.quicksand(
          fontSize: 20,
          fontWeight: FontWeight.w600, // Semibold
          color: AppColors.secondaryColor,
        ),
        bodyLarge: GoogleFonts.quicksand(
          fontSize: 15,
          fontWeight: FontWeight.normal, // Regular
          color: AppColors.secondaryColor,
        ),
        labelLarge: GoogleFonts.quicksand(
          fontSize: 15,
          fontWeight: FontWeight.bold, // Bold
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
