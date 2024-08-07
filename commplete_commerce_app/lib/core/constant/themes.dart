import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

ThemeData themes() {
  final baseTheme = ThemeData.light(useMaterial3: true);
  final textTheme = _textTheme();
  final colorScheme = _colorScheme();

  return baseTheme.copyWith(
    colorScheme: colorScheme,
    textTheme: textTheme,
    inputDecorationTheme: _inputDecorationTheme(textTheme),
    appBarTheme: _appBarTheme(textTheme),
  );
}

AppBarTheme _appBarTheme(TextTheme textTheme) {
  return AppBarTheme(
      centerTitle: true,
      titleTextStyle: textTheme.headlineSmall!
          .copyWith(color: Colors.black.withOpacity(.7)),
      backgroundColor: Colors.transparent,
      elevation: 0);
}

ColorScheme _colorScheme() {
  return ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    surface: AppColor.backgroundColor,
  );
}

TextTheme _textTheme() {
  return TextTheme(
    headlineSmall:
        GoogleFonts.poppins(color: AppColor.lightBlack, fontSize: 20),
    displayLarge: GoogleFonts.poppins(
        color: AppColor.lightBlack, fontWeight: FontWeight.w600, fontSize: 22),
    bodyLarge: GoogleFonts.poppins(color: AppColor.grey, fontSize: 15),
    bodyMedium: GoogleFonts.poppins(color: AppColor.grey, fontSize: 13),
    labelLarge: GoogleFonts.poppins(
        color: AppColor.lightBlack, fontWeight: FontWeight.w600, fontSize: 19),
    labelMedium: GoogleFonts.poppins(
        color: Get.isDarkMode ? AppColor.lightWhite : AppColor.lightBlack,
        fontSize: 17),
    labelSmall: GoogleFonts.poppins(color: AppColor.lightBlack, fontSize: 12),
  );
}

InputDecorationTheme _inputDecorationTheme(TextTheme textTheme) {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    gapPadding: 10,
    borderSide: const BorderSide(color: Colors.black54),
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
