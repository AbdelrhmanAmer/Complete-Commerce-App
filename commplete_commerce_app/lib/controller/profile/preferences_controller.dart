import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreferencesController extends GetxController {
  bool isDarkTheme = Get.isDarkMode;

  toggleTheme(bool newValue) {
    isDarkTheme = newValue;
    Get.changeThemeMode(isDarkTheme ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}
