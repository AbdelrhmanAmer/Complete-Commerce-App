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
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: _inputDecorationTheme(textTheme, isDarkMode: false),
    appBarTheme: _appBarTheme(textTheme, false),
    checkboxTheme: _checkboxTheme(),
  );
}

ThemeData darkTheme() {
  final baseTheme = ThemeData.dark(useMaterial3: true);
  final colorScheme = _colorScheme(true);
  final textTheme = _textTheme(true, colorScheme);

  return baseTheme.copyWith(
    colorScheme: colorScheme,
    textTheme: textTheme,
    scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: _inputDecorationTheme(textTheme, isDarkMode: true),
    checkboxTheme: _checkboxTheme(),
    appBarTheme: _appBarTheme(textTheme, true),
  );
}

CheckboxThemeData _checkboxTheme() {
  return CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
      side: const BorderSide(color: Colors.blue),
    ),
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
      primary: isDarkMode
          ? AppColor.primaryColor.withOpacity(.8)
          : AppColor.primaryColor,
      onPrimary: isDarkMode ? AppColor.lightBlack : AppColor.lightWhite,
      secondary: AppColor.darkText,
      onSecondary: AppColor.lightDarkText,
      onSecondaryContainer: isDarkMode ? Colors.black : Colors.white,
      onPrimaryContainer: isDarkMode ? Colors.white : Colors.black,
      surfaceContainerHighest:
          isDarkMode ? AppColor.lightDarkText : AppColor.lightWhiteText,
      surfaceContainerHigh: isDarkMode
          ? AppColor.lightDarkBackground
          : AppColor.lightWhiteBackground);
}

TextTheme _textTheme(bool isDarkMode, ColorScheme colorScheme) {
  return TextTheme(
    headlineSmall: GoogleFonts.poppins(
        color: colorScheme.onSurface,
        fontSize: 14,
        fontWeight: FontWeight.w600),
    headlineLarge: GoogleFonts.poppins(
        color: colorScheme.onSurface,
        fontSize: 24,
        fontWeight: FontWeight.w500),
    displayLarge: GoogleFonts.poppins(
      color: colorScheme.onSurface,
      fontWeight: FontWeight.w600,
      fontSize: 26,
    ),
    displaySmall: GoogleFonts.poppins(
      color: colorScheme.onSurface,
      fontWeight: FontWeight.w400,
      fontSize: 21,
    ),
    titleLarge: GoogleFonts.poppins(
        color: colorScheme.onSurface,
        fontSize: 20,
        fontWeight: FontWeight.w500),
    titleMedium:
        GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 18),
    titleSmall: GoogleFonts.poppins(
      color: colorScheme.onSurface,
      fontSize: 16,
    ),
    bodyLarge: GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 16),
    bodyMedium: GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 14),
    bodySmall: GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 13),
    labelLarge: GoogleFonts.poppins(
        color: colorScheme.surfaceContainerHighest, fontSize: 16),
    labelMedium: GoogleFonts.poppins(
        color: colorScheme.surfaceContainerHighest, fontSize: 15),
    labelSmall: GoogleFonts.poppins(
        color: colorScheme.surfaceContainerHighest, fontSize: 13),
  );
}

InputDecorationTheme _inputDecorationTheme(TextTheme textTheme,
    {required bool isDarkMode}) {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.transparent),
  );
  var focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: AppColor.primaryColor),
  );

  return InputDecorationTheme(
    hintStyle: textTheme.labelLarge,
    errorStyle: textTheme.labelSmall!.copyWith(color: Colors.red[900]),
    filled: true,
    fillColor: isDarkMode
        ? AppColor.lightDarkBackground
        : AppColor.lightWhiteBackground,
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: focusedBorder,
    disabledBorder: outlineInputBorder,
    contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
  );
}
