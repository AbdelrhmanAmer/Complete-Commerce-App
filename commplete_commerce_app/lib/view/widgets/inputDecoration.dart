  import 'package:flutter/material.dart';
  
  InputDecoration inputDecoration({required labelText, hintText, icon}) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      suffixIcon: icon,
    );
  }