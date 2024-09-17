import 'package:client/core/theme/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(ThemeDataStyle.light);

  void changeTheme() {
    if (state == ThemeDataStyle.light) {
      state = ThemeDataStyle.dark;
    } else {
      state = ThemeDataStyle.light;
    }
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>(
  (ref) => ThemeNotifier(),
);
