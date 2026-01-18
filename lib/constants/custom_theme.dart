import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.green,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    textTheme: TextTheme(
      titleSmall: GoogleFonts.openSans(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.openSans(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: GoogleFonts.openSans(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.purple,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    textTheme: TextTheme(
      titleSmall: GoogleFonts.openSans(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.openSans(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: GoogleFonts.openSans(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
