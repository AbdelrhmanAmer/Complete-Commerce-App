import 'package:commplete_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

  InputDecoration inputDecoration({required labelText,String? hintText, IconData? iconData}) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      suffixIcon: Icon(iconData, size: 22, color: AppColor.grey.withOpacity(.7),),
    );
  }