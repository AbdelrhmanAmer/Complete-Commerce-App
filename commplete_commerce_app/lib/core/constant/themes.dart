import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

ThemeData lightTheme() {
  final baseTheme = ThemeData.light(useMaterial3: true);
  final colorScheme = _colorScheme(false);
  final textTheme = _textTheme(false, colorScheme);

  return baseTheme.copyWith(
    colorScheme: colorScheme,
    textTheme: textTheme,
    scaffoldBackgroundColor: AppColor.lightWhiteBackground,
    inputDecorationTheme: _inputDecorationTheme(textTheme, isDarkMode: false),
    appBarTheme: _appBarTheme(textTheme, false),
  );
}

ThemeData darkTheme() {
  final baseTheme = ThemeData.dark(useMaterial3: true);
  final colorScheme = _colorScheme(true);
  final textTheme = _textTheme(true, colorScheme);

  return baseTheme.copyWith(
    colorScheme: colorScheme,
    textTheme: textTheme,
    scaffoldBackgroundColor: AppColor.lightDarkBackground,
    inputDecorationTheme: _inputDecorationTheme(textTheme, isDarkMode: true),
    appBarTheme: _appBarTheme(textTheme, true),
  );
}

AppBarTheme _appBarTheme(TextTheme textTheme, bool isDarkMode) {
  return AppBarTheme(
    centerTitle: true,
    titleTextStyle: textTheme.headlineSmall!.copyWith(
        fontSize: 18,
        color: isDarkMode
            ? AppColor.lightWhite.withOpacity(.7)
            : Colors.black.withOpacity(.7)),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

ColorScheme _colorScheme(bool isDarkMode) {
  return ColorScheme.fromSeed(
      seedColor: AppColor.primaryColor,
      surface:
          isDarkMode ? AppColor.darkBackgroundColor : AppColor.backgroundColor,
      onSurface: isDarkMode ? AppColor.whiteText : AppColor.darkText,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      surfaceContainerHighest:
          isDarkMode ? AppColor.lightDarkText : AppColor.lightWhiteText,
      primary: isDarkMode
          ? AppColor.primaryColor.withOpacity(.8)
          : AppColor.primaryColor,
      onPrimary: isDarkMode ? AppColor.lightBlack : AppColor.lightWhite,
      secondary: AppColor.darkText,
      onSecondary: AppColor.lightDarkText,
      onSecondaryContainer: isDarkMode ? Colors.black : Colors.white,
      onPrimaryContainer: isDarkMode ? Colors.white : Colors.black,
      surfaceContainerHigh: isDarkMode
          ? AppColor.lightDarkBackground
          : AppColor.lightWhiteBackground);
}

TextTheme _textTheme(bool isDarkMode, ColorScheme colorScheme) {
  return TextTheme(
    headlineSmall:
        GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 20),
    displayLarge: GoogleFonts.poppins(
      color: colorScheme.onSurface,
      fontWeight: FontWeight.w600,
      fontSize: 28,
    ),
    displaySmall: GoogleFonts.poppins(
      color: colorScheme.onSurface,
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
    titleLarge: GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 20),
    titleMedium:
        GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 18),
    titleSmall: GoogleFonts.poppins(
      color: colorScheme.onSurface,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 15),
    bodyMedium: GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 14),
    bodySmall: GoogleFonts.poppins(
        color: colorScheme.surfaceContainerHighest, fontSize: 13),
    labelLarge: GoogleFonts.poppins(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 19),
    labelMedium:
        GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 15),
    labelSmall: GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 13),
  );
}

InputDecorationTheme _inputDecorationTheme(TextTheme textTheme,
    {required bool isDarkMode}) {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    gapPadding: 10,
    borderSide: BorderSide(
        color: isDarkMode ? AppColor.lightWhite : AppColor.lightBlack),
  );
  return InputDecorationTheme(
    hintStyle: textTheme.labelSmall,
    labelStyle: textTheme.labelMedium,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
    contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
  );
}
