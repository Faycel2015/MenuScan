import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Vibrant Orange
  static const Color primary = Color(0xFFFF6B35);
  static const Color primaryLight = Color(0xFFFFB4A2);
  static const Color primaryDark = Color(0xFFE55A2B);

  // Accent Colors - Deep Blue
  static const Color accent = Color(0xFF004E89);
  static const Color accentLight = Color(0xFF3A7CA5);
  static const Color accentDark = Color(0xFF003459);

  // Secondary - Golden Yellow
  static const Color secondary = Color(0xFFFFA62B);
  static const Color secondaryLight = Color(0xFFFFD495);

  // Background & Surface
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF8F9FA);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color divider = Color(0xFFE9ECEF);

  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textLight = Color(0xFF9E9E9E);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Semantic Colors
  static const Color success = Color(0xFF28A745);
  static const Color error = Color(0xFFDC3545);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF17A2B8);

  // Transparent variants using withValues
// Transparent variants using withValues
  static Color primaryAlpha(double opacity) => primary.withValues(alpha: opacity * 255);
  static Color accentAlpha(double opacity) => accent.withValues(alpha: opacity * 255);
  static Color blackAlpha(double opacity) => Colors.black.withValues(alpha: opacity * 255);

  // Gradients
  static const LinearGradient sunsetGradient = LinearGradient(
    colors: [Color(0xFFFF6B35), Color(0xFFFFA62B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient oceanGradient = LinearGradient(
    colors: [Color(0xFF004E89), Color(0xFF17A2B8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFFFF6B35), Color(0xFFE55A2B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
