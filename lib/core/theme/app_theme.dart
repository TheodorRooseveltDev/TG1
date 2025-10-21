import 'package:flutter/material.dart';

/// Casino-themed color scheme with dark purple and neon accents
/// 60% - Dark purple background
/// 30% - Neon Gold accent (secondary)
/// 10% - White/Light (highlights)
class AppTheme {
  // 60% - Dark Purple Casino Colors
  static const Color primaryDark = Color(0xFF0D0221); // Deep purple/black
  static const Color primaryMedium = Color(0xFF1A0F2E); // Medium dark purple
  static const Color primaryLight = Color(0xFF2B1B3D); // Lighter dark purple
  
  // Purple blob colors for background
  static const Color blobPurple1 = Color(0xFF4A148C); // Deep purple
  static const Color blobPurple2 = Color(0xFF6A1B9A); // Medium purple
  static const Color blobPurple3 = Color(0xFF8E24AA); // Light purple
  static const Color blobPurple4 = Color(0xFF9C27B0); // Vibrant purple
  
  // 30% - Neon Gold/Accent Colors
  static const Color accentGold = Color(0xFFFFD700); // Bright neon gold
  static const Color accentGoldLight = Color(0xFFFFE74C); // Light neon gold
  static const Color accentGoldDark = Color(0xFFD4AF37); // Dark gold
  
  // Neon accent colors for variety
  static const Color neonPurple = Color(0xFFBF40BF); // Neon purple
  static const Color neonBlue = Color(0xFF00E5FF); // Neon cyan
  static const Color neonPink = Color(0xFFFF10F0); // Neon pink
  static const Color neonGreen = Color(0xFF39FF14); // Neon green
  
  // 10% - Light/Highlight Colors
  static const Color textLight = Color(0xFFFFFFFF); // Pure white
  static const Color textGray = Color(0xFFB0B3C1); // Light gray
  static const Color textDark = Color(0xFF6B7280); // Medium gray
  
  // Status colors
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color disclaimerRed = Color(0xFFFF3333); // Bright red for disclaimer
  
  // Sharp corner radius (minimal)
  static const double sharpRadius = 2.0;
  static const double mediumRadius = 4.0;
  
  // Neon border decoration helper
  static BoxDecoration neonBorder({
    Color color = accentGold,
    double borderWidth = 2.0,
    double blurRadius = 8.0,
    double spreadRadius = 0.0,
    Color? backgroundColor,
    double radius = sharpRadius,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? primaryMedium,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: color,
        width: borderWidth,
      ),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.6),
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
        ),
      ],
    );
  }
  
  // Multi-color neon border decoration (casino style)
  static BoxDecoration casinoNeonBorder({
    double borderWidth = 2.0,
    Color? backgroundColor,
    double radius = sharpRadius,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? primaryMedium,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: accentGold,
        width: borderWidth,
      ),
      boxShadow: [
        BoxShadow(
          color: accentGold.withOpacity(0.5),
          blurRadius: 8.0,
          spreadRadius: 0.0,
        ),
        BoxShadow(
          color: neonPurple.withOpacity(0.3),
          blurRadius: 12.0,
          spreadRadius: 1.0,
        ),
      ],
    );
  }
  
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
