import 'package:flutter/material.dart';
import 'package:get/get.dart';

showCustomSnackbar({required String title, String content = ''}) {
  Color? backgroundColor = title == 'Success'
      ? Colors.green
      : title == 'Failure' || title == 'Error'
          ? Colors.red
          : Colors.amber;
  Color? textColor =
      backgroundColor == Colors.green || backgroundColor == Colors.amber
          ? Colors.black
          : Colors.white;

  Get.snackbar(title, content,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
      colorText: textColor.withOpacity(.8),
      backgroundColor: backgroundColor.withOpacity(.3));
}
