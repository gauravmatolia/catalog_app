import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    fontFamily: GoogleFonts.sono().fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: GoogleFonts.sono(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    fontFamily: GoogleFonts.sono().fontFamily,
    brightness: Brightness.dark,
  );
}