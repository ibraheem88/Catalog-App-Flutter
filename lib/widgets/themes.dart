import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Themes {
  static ThemeData get lightTheme => ThemeData(
      canvasColor: creamColor,
      cardColor: Colors.white,
      primaryColor: darkBluishColor,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: darkBluishColor, outline: Colors.grey),
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black)));

  static ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      primaryColor: lightBluishColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.white,
          brightness: Brightness.dark,
          outline: Colors.grey),
      canvasColor: darkColor,
      cardColor: Colors.black,
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white)));

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
