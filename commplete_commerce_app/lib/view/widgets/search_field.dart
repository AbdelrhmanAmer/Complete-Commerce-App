import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/constants.dart';
import '../../core/constant/color.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {super.key,
      required this.hintText,
      this.radius = 12,
      this.widthPercent = .9});

  final String? hintText;
  final double radius;
  final double widthPercent;
  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(12));
    return SizedBox(
      width: size.width * widthPercent,
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 10), // Adjust padding as needed
              child: Icon(CupertinoIcons.search),
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Get.isDarkMode
                      ? AppColor.lightDarkText
                      : AppColor.lightWhiteText,
                  fontWeight: FontWeight.bold,
                ),
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            disabledBorder: outlineInputBorder,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(radius)),
            filled: true,
            fillColor: Get.isDarkMode
                ? AppColor.lightDarkBackground
                : AppColor.lightwhiteBackground),
      ),
    );
  }
}
