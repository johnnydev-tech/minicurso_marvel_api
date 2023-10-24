import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'palette.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    final darkTheme = ThemeData(
      scaffoldBackgroundColor: Palette.dark,
      cardColor: Palette.darkAccent,
      iconTheme: const IconThemeData(
        color: Palette.light,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
          color: Palette.light,
          fontSize: 16.0,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Palette.light,
          fontSize: 14.0,
        ),
        displayLarge: GoogleFonts.poppins(
          fontSize: 34.0,
          color: Palette.light,
        ),
        displayMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 20.0,
          color: Palette.light,
        ),
        displaySmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 18.0,
          color: Palette.light,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 20.0,
          color: Palette.light,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Palette.light,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 24.0,
          color: Palette.light,
        ),
        labelLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          color: Palette.light,
        ),
        labelMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          color: Palette.light,
        ),
        labelSmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          color: Palette.light,
        ),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: GoogleFonts.poppins(
          color: Palette.white,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
        subtitleTextStyle: GoogleFonts.poppins(
          color: Palette.dark,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Palette.primary),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 4.0,
            ),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Palette.light,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
            GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Palette.white,
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(
              width: .5,
              color: Palette.light,
            ),
          ),
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(
          Palette.primary,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Palette.light,
        ),
        titleTextStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
          color: Palette.light,
        ),
        backgroundColor: Palette.dark,
        elevation: 1,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Palette.darkAccent,
        selectedItemColor: Palette.white,
        unselectedItemColor: Palette.gray,
        type: BottomNavigationBarType.fixed,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Palette.white,
        unselectedLabelColor: Palette.gray,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: GoogleFonts.poppins(
          fontSize: 16.0,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 2.0,
            color: Palette.primary,
          ),
        ),
      ),
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: Palette.primary,
            secondary: Palette.primaryAccent,
            brightness: Brightness.dark,
          ),
    );
    return darkTheme;
  }
}
