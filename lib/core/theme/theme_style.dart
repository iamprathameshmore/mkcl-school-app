import 'package:flutter/material.dart';

class ThemeDataStyle {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.white,
      onSurface: Colors.grey.shade300,
      primary: Colors.black,
      secondary: Colors.deepPurple.shade300,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Color(0xff121212),
      onSurface: Colors.grey.shade900,
      primary: Colors.white,
      secondary: Colors.deepPurple.shade700,
    ),
  );
}
