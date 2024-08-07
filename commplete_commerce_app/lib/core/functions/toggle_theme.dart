import 'package:get/get.dart';

import '../constant/themes.dart';

void toggleTheme(){
  Get.changeTheme(Get.isDarkMode ? darkTheme() : lightTheme());
}