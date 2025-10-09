import 'package:flutter/material.dart';

/// Professional 60:30:10 color scheme for casino quiz app
/// 60% - Dark background (primary)
/// 30% - Gold accent (secondary)
/// 10% - White/Light (highlights)
class AppTheme {
  // 60% - Dark Professional Colors
  static const Color primaryDark = Color(0xFF0A0E27); // Deep navy/black
  static const Color primaryMedium = Color(0xFF1A1F3A); // Medium dark
  static const Color primaryLight = Color(0xFF2A2F4A); // Lighter dark
  
  // 30% - Gold/Accent Colors
  static const Color accentGold = Color(0xFFD4AF37); // Classic gold
  static const Color accentGoldLight = Color(0xFFE5C158); // Light gold
  static const Color accentGoldDark = Color(0xFFB8941F); // Dark gold
  
  // 10% - Light/Highlight Colors
  static const Color textLight = Color(0xFFFFFFFF); // Pure white
  static const Color textGray = Color(0xFFB0B3C1); // Light gray
  static const Color textDark = Color(0xFF6B7280); // Medium gray
  
  // Status colors
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  
  // Sharp corner radius (minimal)
  static const double sharpRadius = 2.0;
  static const double mediumRadius = 4.0;
  
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primaryDark,
      primaryColor: accentGold,
      colorScheme: const ColorScheme.dark(
        primary: accentGold,
        secondary: accentGoldLight,
        surface: primaryMedium,
        error: error,
      ),
      
      // AppBar theme - sharp, professional
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryMedium,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textLight,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
      
      // Card theme - sharp edges
      cardTheme: const CardThemeData(
        color: primaryMedium,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(sharpRadius)),
        ),
      ),
      
      // Elevated button - sharp, gold accent
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentGold,
          foregroundColor: primaryDark,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(sharpRadius)),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
          ),
        ),
      ),
      
      // Text button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: accentGold,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      
      // Input decoration - sharp borders
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: primaryLight,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(sharpRadius)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(sharpRadius)),
          borderSide: BorderSide(color: primaryLight, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(sharpRadius)),
          borderSide: BorderSide(color: accentGold, width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(sharpRadius)),
          borderSide: BorderSide(color: error, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle: const TextStyle(color: textGray),
        hintStyle: const TextStyle(color: textDark),
      ),
      
      // Text theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: textLight,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
        displayMedium: TextStyle(
          color: textLight,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),
        displaySmall: TextStyle(
          color: textLight,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
        ),
        headlineMedium: TextStyle(
          color: textLight,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
        ),
        titleLarge: TextStyle(
          color: textLight,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
        ),
        bodyLarge: TextStyle(
          color: textLight,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          color: textGray,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
      ),
    );
  }
}
