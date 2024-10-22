import 'dart:convert';

import 'package:get/get.dart';

import '../services/services.dart';
import '../../data/model/user.dart';

User? getSharedUser() {
  MyServices myServices = Get.find();

  String? userJson = myServices.sharedPreferences.getString('user');
  if (userJson != null) {
    Map<String, dynamic> userMap = jsonDecode(userJson);
    return User.fromJson(userMap);
  } else {
    return null;
  }
}
