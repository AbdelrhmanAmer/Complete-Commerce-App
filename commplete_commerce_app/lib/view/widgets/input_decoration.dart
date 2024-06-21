import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

InputDecoration inputDecoration(
    {required labelText, String? hintText, IconData? iconData}) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    suffixIcon: Icon(
      iconData,
      size: 22,
      color: AppColor.grey.withOpacity(.7),
    ),
  );
}
