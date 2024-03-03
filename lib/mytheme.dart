import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color lightColor = Color(0xffB7935F);
  static const Color darkColor = Color(0xff141A2E);
  static const Color gold = Color(0xffFACC1D);

  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: lightColor,
          onPrimary: Colors.black54,
          secondary: lightColor,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.transparent,
          onBackground: lightColor,
          surface: lightColor,
          onSurface: lightColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        selectedLabelStyle: GoogleFonts.quicksand(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: GoogleFonts.quicksand(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: lightColor,
      textTheme: TextTheme(
          titleMedium: GoogleFonts.elMessiri(
              color: const Color(0xff242424),
              fontSize: 30,
              fontWeight: FontWeight.bold),
          bodyMedium: GoogleFonts.elMessiri(
              color: const Color(0xff242424),
              fontSize: 25,
              fontWeight: FontWeight.w600),
          bodySmall: GoogleFonts.elMessiri(
              color: const Color(0xff242424),
              fontSize: 20,
              fontWeight: FontWeight.normal),
          titleSmall: GoogleFonts.elMessiri(
              color: const Color(0xff242424),
              fontSize: 25,
              fontWeight: FontWeight.normal)),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Color(0xff242424),
          size: 30,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ));
  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: darkColor,
          onPrimary: Colors.white,
          secondary: darkColor,
          onSecondary: gold,
          error: Colors.red,
          onError: darkColor,
          background: Colors.transparent,
          onBackground: darkColor,
          surface: Colors.white,
          onSurface: gold),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: gold,
        selectedLabelStyle: GoogleFonts.quicksand(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: GoogleFonts.quicksand(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: darkColor,
      textTheme: TextTheme(
          titleMedium: GoogleFonts.elMessiri(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          bodyMedium: GoogleFonts.elMessiri(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          bodySmall: GoogleFonts.elMessiri(
              color: gold, fontSize: 20, fontWeight: FontWeight.normal),
          titleSmall: GoogleFonts.elMessiri(
              color: gold, fontSize: 25, fontWeight: FontWeight.normal)),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Color(0xffF8F8F8),
          size: 30,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ));
}
