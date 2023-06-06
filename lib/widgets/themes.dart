import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData get lightTheme => ThemeData(
      primarySwatch: Colors.orange,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0.0));

  static ThemeData get darkTheme => ThemeData(brightness: Brightness.dark);
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBluishColor = const Color(0xff403b58);
}
