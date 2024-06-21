import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

ThemeData themes() {
  return ThemeData(
    colorScheme: colorScheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    useMaterial3: true,
  );
}

ColorScheme colorScheme() {
  return ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    surface: AppColor.backgroundColor,
  );
}

TextTheme textTheme() {
  return TextTheme(
    headlineSmall: GoogleFonts.poppins(fontSize: 20),
    displayLarge:
        GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 22),
    bodyLarge: GoogleFonts.poppins(color: AppColor.grey, fontSize: 14),
    labelLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 19),
    labelMedium: GoogleFonts.poppins(fontSize: 17),
    labelSmall: GoogleFonts.poppins(fontSize: 12),
  );
}

InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    gapPadding: 10,
    borderSide: const BorderSide(color: Colors.black54),
  );
  return InputDecorationTheme(
    hintStyle: Get.textTheme.labelSmall,
    labelStyle: Get.textTheme.labelMedium,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
    contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
  );
}
