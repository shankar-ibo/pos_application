import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpn_pos_application/custom_colors.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
      useMaterial3: true,
      primaryColor: CustomColors.primaryColor,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: CustomColors.primaryColor,
          onPrimary: Colors.black,
          secondary: CustomColors.secondaryColor,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black),
      textTheme: GoogleFonts.interTextTheme(
        Theme.of(context).textTheme,
      ).copyWith(
        displayLarge: GoogleFonts.inter(), // 57px
        displayMedium: GoogleFonts.inter(), // 45px
        displaySmall: GoogleFonts.inter(), // 36px
        headlineLarge: GoogleFonts.inter(), // 36px
        headlineMedium: GoogleFonts.inter(), // 28px
        headlineSmall: GoogleFonts.inter(), // 24px
        titleLarge: GoogleFonts.inter(), // 32px
        titleMedium: GoogleFonts.inter(), // 20px
        titleSmall: GoogleFonts.inter(), // 16px
        bodyLarge: GoogleFonts.inter(), // 24px
        bodyMedium: GoogleFonts.inter(), // 16px
        bodySmall: GoogleFonts.inter(), // 14px
        labelLarge: GoogleFonts.inter(), // 14px
        labelMedium: GoogleFonts.inter(), // 12px
        labelSmall: GoogleFonts.inter(), // 11px,
      ),
      buttonTheme: ButtonThemeData(buttonColor: Theme.of(context).primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black87,
          backgroundColor: Colors.grey[300],
          minimumSize: Size(88, 36),
          padding: EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
      ));
}
