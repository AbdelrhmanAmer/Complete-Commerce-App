import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';

showCustomSnackbar({required String title, String content = ''}) {
  Color? backgroundColor = title == 'Success'
      ? Get.isDarkMode
          ? AppColor.lightSuccessColor
          : AppColor.darkSuccessColor
      : title == 'Failure' || title == 'Error'
          ? Colors.red
          : Colors.amber;
  Color? textColor = Colors.white;

  Get.snackbar(title, content,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
      colorText: textColor.withOpacity(.8),
      backgroundColor: backgroundColor.withOpacity(.3));
}
