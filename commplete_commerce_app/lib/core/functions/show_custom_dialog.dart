import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomDialog({required String title, String? message = ''}) {
  Color? color = title == 'Success'
      ? Colors.green
      : title == 'Failure' || title == 'Error'
          ? Colors.red
          : Colors.amber;
  IconData iconData = title == 'Success'
      ? Icons.check_circle
      : title == 'Failure' || title == 'Error'
          ? CupertinoIcons.clear_thick_circled
          : Icons.error;

  Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: color.withOpacity(.8),
    ),
    middleText: message!,
    middleTextStyle: const TextStyle(fontSize: 18, color: Colors.black87),
    backgroundColor: Colors.white,
    radius: 10,
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(
            iconData,
            color: color,
            size: 100,
          ),
          const SizedBox(height: 10),
          Text(message),
        ],
      ),
    ),
  );
}
