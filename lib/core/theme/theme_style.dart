import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeDataStyle {
  static ThemeData light = ThemeData(
    textTheme: GoogleFonts.syneTextTheme(TextTheme(
        // titleLarge: TextStyle(
        //   fontWeight: FontWeight.w700,
        //   color: Colors.indigo.shade600,
        // ),
        // bodyLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
        // bodyMedium: TextStyle(fontWeight: FontWeight.w700),
        // bodySmall: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)
        )),
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.indigo.shade50,
      onSurface: Colors.white,
      primary: Colors.black,
      secondary: Colors.deepPurple.shade300,
    ),
  );

  static ThemeData dark = ThemeData(
    textTheme: GoogleFonts.syneTextTheme(),
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: const Color(0xff121212),
      onSurface: Colors.grey.shade900,
      primary: Colors.white,
      secondary: Colors.deepPurple.shade700,
    ),
  );
}
