import 'package:flutter/material.dart';

class Styles {
  static ThemeData mainTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionHandleColor: primaryColor,
      selectionColor: primaryColor,
    ),
    primaryColor: primaryColor,
    accentColor: darkColor,
    scaffoldBackgroundColor: mainBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: mainBackgroundColor,
    ),
    // textTheme: GoogleFonts.montserratTextTheme(),
    backgroundColor: mainBackgroundColor,
  );

  static Color primaryColor = Color(0xffFF8F00);
  static Color darkColor = Color(0xff744203);
  static Color mainBackgroundColor = Colors.black;
}