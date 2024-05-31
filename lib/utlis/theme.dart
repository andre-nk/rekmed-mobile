import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData rekmedTheme = ThemeData(
  textTheme: GoogleFonts.dmSansTextTheme(),
  primaryColor: const Color(0xFF04AE91),
  focusColor: const Color(0xFF04AE91),
  useMaterial3: false,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xFF04AE91),
    outline: const Color(0xFF04AE91),
  ),
);

class AppTheme {
  static ThemeData get theme => rekmedTheme;
}
