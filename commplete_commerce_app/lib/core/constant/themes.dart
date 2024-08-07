import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

ThemeData themes({required bool isDarkMode}) {
  final baseTheme = isDarkMode
      ? ThemeData.dark(useMaterial3: true)
      : ThemeData.light(useMaterial3: true);
  final colorScheme = _colorScheme(isDarkMode);
  final textTheme = _textTheme(isDarkMode, colorScheme);

  return baseTheme.copyWith(
    colorScheme: colorScheme,
    textTheme: textTheme,
    inputDecorationTheme:
        _inputDecorationTheme(textTheme, isDarkMode: isDarkMode),
    appBarTheme: _appBarTheme(textTheme),
  );
}

AppBarTheme _appBarTheme(TextTheme textTheme) {
  return AppBarTheme(
    centerTitle: true,
    titleTextStyle:
        textTheme.headlineSmall!.copyWith(color: Colors.black.withOpacity(.7)),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

ColorScheme _colorScheme(bool isDarkMode) {
  return ColorScheme.fromSeed(
    seedColor: AppColor.primaryColor,
    surface:
        isDarkMode ? AppColor.darkBackgroundColor : AppColor.backgroundColor,
    onSurface: isDarkMode ? AppColor.lightWhite : AppColor.lightBlack,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    surfaceContainerHighest:
        isDarkMode ? AppColor.lightGrey : AppColor.darkGrey,
    primary: AppColor.primaryColor,
    onPrimary: AppColor.lightWhite,
    secondary: AppColor.darkGrey,
    onSecondary: AppColor.lightWhite,
    tertiary: AppColor.lightSuccessColor,
    tertiaryContainer: AppColor.darkSuccessColor,
  );
}

TextTheme _textTheme(bool isDarkMode, ColorScheme colorScheme) {
  return TextTheme(
    headlineSmall:
        GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 20),
    displayLarge: GoogleFonts.poppins(
      color: colorScheme.onSurface,
      fontWeight: FontWeight.w600,
      fontSize: 22,
    ),
    bodyLarge: GoogleFonts.poppins(
        color: colorScheme.surfaceContainerHighest, fontSize: 15),
    bodyMedium: GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 13),
    labelLarge: GoogleFonts.poppins(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 19),
    labelMedium:
        GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 17),
    labelSmall: GoogleFonts.poppins(color: colorScheme.onSurface, fontSize: 12),
  );
}

InputDecorationTheme _inputDecorationTheme(TextTheme textTheme,
    {required bool? isDarkMode}) {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    gapPadding: 10,
    borderSide: BorderSide(
        color: isDarkMode! ? AppColor.lightWhite : AppColor.lightBlack),
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
