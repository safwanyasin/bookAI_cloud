import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      focusColor: Color(0xFFD45555), // Main color
      primaryColor: Colors.white, // Secondary color
      appBarTheme: AppBarTheme(
        color: Colors.transparent, // Transparent app bar
        elevation: 0, // No shadow
        iconTheme: IconThemeData(color: Colors.white), // White icons
        titleTextStyle: GoogleFonts.quicksand(
          fontSize: 20,
          fontWeight: FontWeight.w600, // Semibold
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.quicksand(
          fontSize: 20,
          fontWeight: FontWeight.w600, // Semibold
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.quicksand(
          fontSize: 15,
          fontWeight: FontWeight.normal, // Regular
          color: Colors.white,
        ),
        labelLarge: GoogleFonts.quicksand(
          fontSize: 15,
          fontWeight: FontWeight.bold, // Bold
          color: Colors.white,
        ),
      ),
    );
  }
}
