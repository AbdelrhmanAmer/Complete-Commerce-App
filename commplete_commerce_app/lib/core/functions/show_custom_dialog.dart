import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_strings.dart';

void showCustomDialog({required String title, String? message = ''}) {
  Color? color = title == 'Success'
      ? Colors.green
      : title == 'Failure' || title == 'Error'
          ? Colors.red
          : Colors.amber;

  IconData iconData = title == 'Success'
      ? Icons.check_circle
      : title == 'Failure' && message == AppStrings.internetFailure
          ? CupertinoIcons.wifi_slash
          : title == 'Failure' && message == AppStrings.emailFailure
              ? Icons.cancel_schedule_send
              : title == 'Exists'
                  ? Icons.error
                  : CupertinoIcons.xmark_circle_fill;

  Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: color.withOpacity(.8),
    ),
    middleText: message!,
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
          Text(
            message,
            style: const TextStyle(color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
