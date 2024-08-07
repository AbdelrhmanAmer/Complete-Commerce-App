import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void toggleThemeMode() {
  final isDarkMode = Get.isDarkMode;
  log('Current theme mode: ${Get.isDarkMode}'); // Debugging line
  Get.changeThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
}
